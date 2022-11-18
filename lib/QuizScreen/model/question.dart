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
      answerId: 1,
      question: "Who invented Bitcoin?",
      options: [
        'Santoshi Nakamoto',
        'Satoshi Nakamoto',
        'Satoshi Nakamotor',
        'Satoshi Nankamoto'
      ],
    ),
    Questions(
      id: 1,
      answerId: 3,
      question: "What is the most popular cryptocurrency?",
      options: ['Ethereum', 'Doge', 'Shiba', 'Bitcoin'],
    ),
    Questions(
      id: 2,
      answerId: 2,
      question:
          "A digital currency that has its value pegged to a fiat currency is called?",
      options: ['USDT', 'Bitcoin', 'Stable coin', 'Doge coin'],
    ),
    Questions(
      id: 3,
      answerId: 3,
      question: "Bitcoin was Launched in what year?",
      options: ['2010', '2011', '2007', '2009'],
    ),
    Questions(
      id: 4,
      answerId: 1,
      question: "What is the second largest crypto currency after bitcoin?",
      options: ['Doge', 'Ethereum', 'Solana', 'BNB'],
    ),
    Questions(
      id: 5,
      answerId: 1,
      question: "What was one of the problems that Bitcoin solved?",
      options: [
        'Delayed transfers',
        'Double spending',
        'Delayed Deposit',
        'Inflation'
      ],
    ),
    Questions(
      id: 6,
      answerId: 2,
      question: "What is the name of the CBN digital currency?",
      options: ['Kobo', 'Naira', 'eNaira ', 'Naira coin'],
    ),
    Questions(
      id: 7,
      answerId: 3,
      question:
          "This is a graphical representation of the address that can be read by your mobile phone’s camera.",
      options: ['Bar code', 'QR code', 'URL ', 'All of the above'],
    ),
    Questions(
      id: 8,
      answerId: 1,
      question: "Which of the follwing apps has cheapest trade rates",
      options: ['Meta mask', 'Kochure', 'Trust wallet', 'Roqqu'],
    ),
    Questions(
      id: 9,
      answerId: 1,
      question:
          "___provides an additional level of protection against unauthorized access to your crypto exchange account?.",
      options: ['AML', '2FA', 'KYC', 'FUD'],
    ),
    Questions(
      id: 10,
      answerId: 1,
      question:
          "___is an automated computer program that is hosted and executed on the blockchain?.",
      options: [
        'Cryptocurrency',
        'Smart contract',
        'NFT',
        'Smart program',
        'All of the above'
      ],
    ),
  ];
}
