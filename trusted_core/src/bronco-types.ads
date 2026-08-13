package Bronco.Types with SPARK_Mode is

   --  Dimensionless score represented as integer micro-units in [0, 1].
   --  The representation is intentionally exact and bounded; a future metric
   --  may use another representation only after its measurement equation is
   --  specified.
   subtype Unit_Score is Natural range 0 .. 1_000_000;

   type Observation_Count is range 0 .. 1_000_000_000;

   type Result_State is
     (Valid,
      Invalid_Input,
      Missing,
      Execution_Failure);

   type Decision is
     (Pass,
      Fail,
      Indeterminate);

   type Score_Interval is record
      Lower : Unit_Score;
      Upper : Unit_Score;
   end record;

   function Is_Ordered (Bounds : Score_Interval) return Boolean is
     (Bounds.Lower <= Bounds.Upper);

end Bronco.Types;
