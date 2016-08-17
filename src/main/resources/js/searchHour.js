function YYYYMMDDstart(form,year,month,day)
{
 MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
//先給年下拉框賦內容
 var y = new Date().getFullYear();

//賦月份的下拉框
 for (var i = 1; i < 13; i++)
 month.options.add(new Option(i,i));
 year.value = y;
 month.value = new Date().getMonth() + 1;
 var n = MonHead[new Date().getMonth()];
 if (new Date().getMonth() ==1 && IsPinYear(year.options[year.selectedIndex].value)) n++;
 writeDay(n,day); //賦日期下拉框Author:meizz
 day.value = new Date().getDate();
}


function YYYYDD(str,month,day) //年發生變化時日期發生變化(主要是判斷閏平年)
  {
   var MMvalue = month.options[month.selectedIndex].value;
   if (MMvalue == "" ){ var e = day; optionsClear(e); return;}
   var n = MonHead[MMvalue - 1];
   if (MMvalue ==2 && IsPinYear(str)) n++;
   writeDay(n,day)
  }
  function MMDD(str,year,day) //月發生變化時日期聯動
  {
   var YYYYvalue = year.options[year.selectedIndex].value;
   if (YYYYvalue == "" ){ var e = day; optionsClear(e); return;}
   var n = MonHead[str - 1];
   if (str ==2 && IsPinYear(YYYYvalue)) n++;
   writeDay(n,day)
  }
  function writeDay(n,day) //據條件寫日期的下拉框
  {
   var e = day; optionsClear(e);
   for (var i=1; i<(n+1); i++)
   e.options.add(new Option(i,i));
  }
  function IsPinYear(year)//判斷是否閏平年
  { return(0 == year%4 && (year%100 !=0 || year%400 == 0));}
  function optionsClear(e)
  {
   for (var i=e.options.length; i>0; i--)
   e.remove(i);
  }
  function compDate(SY,SM,SD,EY,EM,ED)
  {
  }
