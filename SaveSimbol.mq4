//+------------------------------------------------------------------+
//|                                                   SaveSimbol.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property description "Сохраняет сиволы открытых графиков в TXT"

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void SaveComment(string strComment)
{
   if(!IsTesting())
   {
       int hFile = FileOpen("OpenSymbols.txt", 
        FILE_BIN | FILE_READ | FILE_WRITE, '\t'); 
      
       FileSeek(hFile, 0, SEEK_END);
       FileWriteString(hFile, strComment, StringLen(strComment));             
       FileClose(hFile);
   }
}


void OnStart()
  {
//---
   long curr = ChartFirst();
   string sym = "";


   while(curr != -1)
      {
         sym = ChartSymbol(curr);
         sym = sym + "\n";
         SaveComment(sym);
         curr = ChartNext(curr);         

      }

  }
//+------------------------------------------------------------------+
