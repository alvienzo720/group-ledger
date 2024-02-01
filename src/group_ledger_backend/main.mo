import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import RbTree "mo:base/RBTree";
import Text "mo:base/Text";



actor {
  var contributions:RbTree.RBTree<Text, Nat> = RbTree.RBTree(Text.compare);

  public query func getContributions(): async [(Text, Nat)]{
    Iter.toArray(contributions.entries())
  };

  public func contribute(entry:Text):async [(Text, Nat)]{

    let contribution_per_person: ?Nat = contributions.get(entry);

    let current_contributions_for_entry: Nat = switch contribution_per_person {
      case(null) 0;
      case(?Nat) Nat
    };

    contributions.put(entry, current_contributions_for_entry);

    Iter.toArray(contributions.entries())
  };

 



}
