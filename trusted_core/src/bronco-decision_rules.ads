with Bronco.Types;

package Bronco.Decision_Rules with SPARK_Mode is
   use Bronco.Types;

   --  Decide whether a point estimate satisfies a minimum threshold.
   --  This is deliberately trivial: the purpose of the initial core is to
   --  establish contracts, bounded types and proof plumbing before adding
   --  statistically richer rules.
   function Decide_Minimum
     (Observed  : Unit_Score;
      Threshold : Unit_Score) return Decision
   with
     Post =>
       (if Observed >= Threshold then
           Decide_Minimum'Result = Pass
        else
           Decide_Minimum'Result = Fail);

   --  Conservative decision from an ordered interval:
   --    Pass          when the complete interval is at/above the threshold.
   --    Fail          when the complete interval is below the threshold.
   --    Indeterminate when the interval crosses the threshold.
   function Decide_Interval
     (Bounds    : Score_Interval;
      Threshold : Unit_Score) return Decision
   with
     Pre  => Is_Ordered (Bounds),
     Post =>
       (if Bounds.Lower >= Threshold then
           Decide_Interval'Result = Pass
        elsif Bounds.Upper < Threshold then
           Decide_Interval'Result = Fail
        else
           Decide_Interval'Result = Indeterminate);

end Bronco.Decision_Rules;
