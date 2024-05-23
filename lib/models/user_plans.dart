enum UserPlan{
  Tier1,
  Tier2,
  Tier3,
}

String _getPlan(UserPlan plan){
    switch(plan){
      case UserPlan.Tier1:
        return 'Tier 1';
      case UserPlan.Tier2:
        return 'Tier 2';
      case UserPlan.Tier3:
        return 'Tier 3';
      default:
        return 'No Plan';
    }
}