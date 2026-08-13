package body Bronco.Decision_Rules with SPARK_Mode is

   function Decide_Minimum
     (Observed  : Unit_Score;
      Threshold : Unit_Score) return Decision
   is
   begin
      if Observed >= Threshold then
         return Pass;
      else
         return Fail;
      end if;
   end Decide_Minimum;

   function Decide_Interval
     (Bounds    : Score_Interval;
      Threshold : Unit_Score) return Decision
   is
   begin
      if Bounds.Lower >= Threshold then
         return Pass;
      elsif Bounds.Upper < Threshold then
         return Fail;
      else
         return Indeterminate;
      end if;
   end Decide_Interval;

end Bronco.Decision_Rules;
