DateHandler = function() {
    let _dateDelimiter = "-";
    let _timeDelimiter = ":";
    let _typeDelimiter = " ";
    
    let _dateForm     = {yyyy: 0, yy: 0, MM: 1, dd: 2};
    let _timeForm	  = {hh: 3, mm: 4, ss: 5};
    let _dayLabelForm = {ee: 6, e: 6};
    let _week         = ["(일)","(월)","(화)","(수)","(목)","(금)","(토)"];
    let _fullWeek     = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
    let _weekType     = { e:_week, ee:_fullWeek }

    this.initDelimiter = function (dateDelimiter, timeDelimiter, typeDelimiter) {
        _dateDelimiter = dateDelimiter;
        _timeDelimiter = timeDelimiter;
        _typeDelimiter = typeDelimiter;
    }

    this.setDateDelimiter = function(dateDelimiter) {
        _dateDelimiter = dateDelimiter;
    }

    this.setTimeDelimiter = function(timeDelimiter) {
        _timeDelimiter = timeDelimiter;
    }

    this.setTypeDelimiter = function(typeDelimiter) {
        _typeDelimiter = typeDelimiter;
    }

    this._getFormatType = function(format) {
        let formatType = {date:[], time:[], dayLabel:[]};

        let formatTypeArr = format.split(" ");

        formatTypeArr.forEach( (val,index) => {
            if( this._isDateType(val) || _dateForm[val] != null ) {
                formatType.date = val.split("-");
                formatType.date.unshift(index);
                return;
            }

            if( this._isTimeType(val) || _timeForm[val] != null ) {
                formatType.time = val.split(":");
                formatType.time.unshift(index);
                return;
            }

            if( _dayLabelForm[val] != null ) {
                formatType.dayLabel.push(index);
                formatType.dayLabel.push(val);
                return;
            }

            console.log("해당 format은 인식할 수 없습니다 : "+val);
        });

        return formatType;
    }

    this._isDateType = function(format) {
        if(format.indexOf("-") < 0) return false;

        return true;
    }

    this._isTimeType = function(format) {
        if(format.indexOf(":") < 0) return false;

        return true;
    }

    this._validateFormatType = function (formatType) {
        if( formatType.date.length == 0 && formatType.time.length == 0 && formatType.dayLabel.length == 0) return false

        for(let i=1; i<formatType.date.length; i++)
            if ( _dateForm[formatType.date[i]] == null ) return false;


        for(let i=1; i<formatType.time.length; i++)
            if ( _timeForm[formatType.time[i]] == null ) return false;

        for(let i=1; i<formatType.dayLabel.length; i++)
            if ( _dayLabelForm[formatType.dayLabel[i]] == null ) return false;

        return true;
    }

    this.getFormatDate = function (date, format) {
        let formatType = this._getFormatType(format);

        if(typeof(date) == "string"){
            date = this.parseDate(date);
        }

        if( !this._validateFormatType(formatType) ) {
            console.log("잘못된 포맷입니다.");
            return;
        }

        let sortArr = this._getSortDate(date, formatType);

        if(formatType.date.length != 0)
            sortArr[formatType.date[0]] = sortArr[formatType.date[0]].join(_dateDelimiter);

        if(formatType.time.length != 0)
            sortArr[formatType.time[0]] = sortArr[formatType.time[0]].join(_timeDelimiter);

        for(let i=(sortArr.length-1); i>=0; i--) {
            if(sortArr[i].length == 0) sortArr.splice(i, 1);
        }

        return sortArr.join(_typeDelimiter);
    }

    this.getKorDate = function (date, format) {
        let formatType = this._getFormatType(format);

        if(typeof(date) == "string"){
            date = this.parseDate(date);
        }

        if (!this._validateFormatType(formatType)) {
            console.log("잘못된 포맷입니다.");
            return;
        }

        let sortArr = this._getSortDate(date, formatType);
        let korDelimiter = this._getKorDelimiter(formatType);

        let korDate = "";
        let korTime = "";

        if(formatType.date.length != 0) {
            sortArr[formatType.date[0]].forEach((val, index) => {
                korDate += val + korDelimiter.date[index];
            });

            sortArr[formatType.date[0]] = korDate;
        }

        if(formatType.time.length != 0) {
            sortArr[formatType.time[0]].forEach((val, index) => {
                korTime += val + korDelimiter.time[index];
            });

            sortArr[formatType.time[0]] = korTime;
        }
        
        for(let i=(sortArr.length-1); i>=0; i--) {
            if(sortArr[i].length == 0) sortArr.splice(i, 1);
        }

        return sortArr.join(_typeDelimiter);
    }

    this._getDateArr = function (date) {
        let year = date.getFullYear();

        let month = (1 + date.getMonth());
        month = month >= 10 ? month : "0" + month;

        let day = date.getDate();
        day = day >= 10 ? day : "0" + day;

        let hour = date.getHours();
        hour = hour >= 10 ? hour : "0" + hour;

        let minute = date.getMinutes();
        minute = minute >= 10 ? minute : "0" + minute;

        let second = date.getSeconds();
        second = second >= 10 ? second : "0" + second;

        let dayLabel = date.getDay();

        return [String(year), String(month), String(day), String(hour), String(minute), String(second), String(dayLabel)];
    }

    this._getSortDate = function (date, formatType) {
        let dateArr = this._getDateArr(date);

        let sortArr = [[],[],[]];
        
        for(let i=1; i<formatType.date.length; i++) {
            let index = _dateForm[formatType.date[i]];
            let date = dateArr[index];

            if (formatType.date[i] == "yy")
                date = String(date).substr(2, 2);

            sortArr[ formatType.date[0] ].push(date);
        }

        for(let i=1; i<formatType.time.length; i++) {
            let index = _timeForm[formatType.time[i]];
            let time = dateArr[index];

            sortArr[ formatType.time[0] ].push(time);
        }

        for(let i=1; i<formatType.dayLabel.length; i++) {
            let index = _dayLabelForm[formatType.dayLabel[i]];
            let numericTypeDayLabel = dateArr[index];
            let StringTypeDayLabel  = _weekType[formatType.dayLabel[i]][numericTypeDayLabel];

            sortArr[ formatType.dayLabel[0] ].push(StringTypeDayLabel);
        }

        return sortArr;
    }

    this._getKorDelimiter = function (formatType) {
        let korDelimiter = {date:[], time:[]};

        let korForm = {
            yyyy: "년",
            yy: "년",
            MM: "월",
            dd: "일",
            hh: "시",
            mm: "분",
            ss: "초"
        }

        formatType.date.forEach( (val,index) => {
            if(index == 0) return;

            let delimiter = korForm[val];

            korDelimiter.date.push(delimiter);
        });

        formatType.time.forEach( (val,index) => {
            if(index == 0) return;
            
            let delimiter = korForm[val];

            korDelimiter.time.push(delimiter);
        });

        return korDelimiter;
    }

    this.nowDate = new Date();

    this.getToday = function () {
        return this.nowDate;
    }

    this.getYesterday = function () {
        return new Date(this.nowDate.getFullYear(), this.nowDate.getMonth(), this.nowDate.getDate() - 1);
    }

    this.getNextday = function () {
        return new Date(this.nowDate.getFullYear(), this.nowDate.getMonth(), this.nowDate.getDate() + 1);
    }

    this.getFirstDayOfMonth = function (date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), date.getMonth(), 1);
    }

    this.getLastDayOfMonth = function (date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), date.getMonth() + 1, 0);
    }

    this.getFirstDayOfYear = function (date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), 0, 1);
    };

    this.getLastDayOfYear = function (date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), 12, 0);
    };

    this.getAddDays = function (num, date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), date.getMonth(), date.getDate() + num);
    }

    this.getAddMonths = function (num, date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear(), date.getMonth() + num, date.getDate());
    }

    this.getAddYears = function (num, date) {
        if (date == null)
            date = this.nowDate;

        return new Date(date.getFullYear() + num, date.getMonth(), date.getDate());
    }

    this.parseDate = function (stringDate, dateType) {

        stringDate = stringDate.replace(/[^0-9]/g, "");

        if(dateType == null) {

            dateType = "yy-MM-dd";
            if(stringDate.toString().length == 8) {
                dateType = "yyyy-MM-dd";
            }

        }
        if (!this.validateType(dateType)) {
            console.log("옳바르지 않은 데이터 타입입니다.");
            return;
        }

        let dateArr = this.getDateArr(stringDate, dateType);

        return new Date(dateArr.join("-"));
    }

    this.getDateArr = function (stringDate, dateType) {
        let dateArr = [];

        let cuttingRule = this.getCuttingRule(dateType);

        cuttingRule.forEach(val => {
            dateArr.push(stringDate.substr(val[0], val[1]));
        });

        let sortArr = this.getSortArr(dateArr, dateType);

        return sortArr;
    }

    this.getCuttingRule = function (dateType) {
        let typeArr = dateType.split("-");
        let rule = [];
        let firstIndex = 0;

        typeArr.forEach(val => {
            let secondIndex = val.length;

            rule.push([firstIndex, secondIndex]);

            firstIndex = (firstIndex + secondIndex);
        });

        return rule;
    };

    this.getSortArr = function (dateArr, dateType) {
        let typeArr = dateType.split("-");
        let sortArr = [];

        let yyyy = typeArr.indexOf("yyyy");
        let yy = typeArr.indexOf("yy");
        let MM = typeArr.indexOf("MM");
        let dd = typeArr.indexOf("dd");

        if (yyyy >= 0)
            sortArr.push(dateArr[yyyy]);

        if (yy >= 0) {
            let add20Year = String(new Date().getFullYear() + 20).substr(2, 2);
            sortArr.push((dateArr[yy] <= add20Year) ? "20" + dateArr[yy] : "19" + dateArr[yy]);
        }

        if (yyyy < 0 && yy < 0) {
            sortArr.push(new Date().getFullYear());
        }

        if (MM >= 0) {
            sortArr.push(dateArr[MM]);
        } else {
            sortArr.push(new Date().getMonth() + 1);
        }

        if (dd >= 0)
            sortArr.push(dateArr[dd]);

        return sortArr;
    };

    this.validateType = function (dateType) {
        let typeArr = dateType.split("-");

        for (let i = 0; i < typeArr.length; i++)
            if (!(typeArr[i] == "yyyy" || typeArr[i] == "yy" || typeArr[i] == "MM" || typeArr[i] == "dd")) return false;

        return true;
    }
}

let dateHandler = new DateHandler();