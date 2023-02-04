class Questions {
  final int? id, answerId;
  final String? question;
  final List<String>? options;

  Questions({
    this.id,
    this.answerId,
    this.question,
    this.options,
  });
}

class QuestionBank {
  List<Questions> questionBank = [
    Questions(
      id: 0,
      answerId: 2,
      question: "What is the name of the first crypto to be created?",
      options: ['Ethereum', 'USDT ', 'Bitcoin', 'Solana'],
    ),
    Questions(
      id: 1,
      answerId: 2,
      question: "Who is the founder of bitcoin ",
      options: [
        'CZ Binance ',
        'Vitalik Buterin',
        'Satoshi N.',
        'Michael Saylor'
      ],
    ),
    Questions(
      id: 2,
      answerId: 2,
      question: "Which of the following does not fluctuate in price",
      options: ['Bitcoin', 'Ethereum', 'USDT', 'Doge'],
    ),
    Questions(
      id: 3,
      answerId: 2,
      question: "What is the total supply of bitcoin?",
      options: ['10 million ', '20 million ', '21 million ', '15 million '],
    ),
    Questions(
      id: 4,
      answerId: 0,
      question: "What is the second largest crypto currency?",
      options: ['Ethereum', 'Bitcoin', 'Bitcoin cash ', 'Safemoon'],
    ),
    Questions(
      id: 5,
      answerId: 1,
      question: "What is the name of the Nigeria digital currency?",
      options: ['Naira coin', 'eNaira', 'Bitcoin', 'Tatcoin'],
    ),
    Questions(
      id: 6,
      answerId: 3,
      question: "Which of the following is not a crypto wallet?",
      options: ['Kochure', 'Trust wallet ', 'Kucoin ', 'Solana'],
    ),
    Questions(
      id: 7,
      answerId: 1,
      question: "A wallet that stores your crypto offline is called?",
      options: [
        'Hot wallet',
        'Cold wallet',
        'trust wallet',
        'Meta mask wallet'
      ],
    ),
    Questions(
      id: 8,
      answerId: 3,
      question: "What year was bitcoin created?",
      options: ['2020', '2000', '2005', '2009'],
    ),
    Questions(
      id: 9,
      answerId: 0,
      question: " The largest holders of bitcoin are called",
      options: ['Whales', 'Shrimp', 'Octopus', 'Sharks'],
    ),
    Questions(
      id: 10,
      answerId: 1,
      question: "What is the technology that powers crypto called?",
      options: ['Bitcoin', 'Blockchain', 'Wallet', 'Doge coin'],
    ),
    Questions(
      id: 11,
      answerId: 1,
      question:
          "What country is number 1 in terms of crypto ownership and adoption?",
      options: ['India', 'Nigeria', 'Dubai', 'America'],
    ),
    Questions(
      id: 12,
      answerId: 0,
      question: "The process of creating new bitcoin is called ",
      options: ['Mining', 'Coding', 'Cryptology', 'Trading'],
    ),
    Questions(
      id: 13,
      answerId: 1,
      question: "Kochure is a crypto exchange that helps you?",
      options: [
        'Mine bitcoin',
        'Convert your crypto to Naira',
        'Stake your crypto',
        'Burn your crypto'
      ],
    ),
    Questions(
      id: 14,
      answerId: 2,
      question: "Bitcoin was first used to purchase ",
      options: ['Meat', 'Burger', 'Pizza', 'Pea nut'],
    ),
  ];
}
