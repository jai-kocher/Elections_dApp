class Candidate {
  Candidate(this.name, this.aadhaar, this.party);
  final String name, aadhaar, party;
}

class CandidateList {
  List<Candidate> candidateList = [
    Candidate('Jai', '123456789012', 'BJP'),
    Candidate('Sreyas', '123456789021', 'DMK'),
    Candidate('Arjun', '123456789031', 'AAP'),
    Candidate('Agilan', '123456789042', 'SP'),
  ];

  List<String> getCandidateNames() {
    List<String> temp = [];
    for (var i in candidateList) {
      temp.add(i.name);
    }
    return temp;
  }

  List<String> getCandidateAadhaars() {
    List<String> temp = [];
    for (var i in candidateList) {
      temp.add(i.aadhaar);
    }
    return temp;
  }

  List<String> getCandidateParties() {
    List<String> temp = [];
    for (var i in candidateList) {
      temp.add(i.party);
    }
    return temp;
  }

  List<Candidate> getCandidates() {
    return candidateList;
  }

  void deleteCandidateByAadhaar(aadhaar) {
    candidateList.removeWhere((element) => element.aadhaar == aadhaar);
  }
}

void main() {
  CandidateList candidateList = CandidateList();
  print(candidateList.getCandidateParties());
}
