class MockData {
  static final User currentUser = User(
    name: 'Elon Musk',
    level: 42,
    balance: 15400.50,
    totalInvestment: 8250.00,
    profileImageUrl: 'https://i.pravatar.cc/150?img=11',
  );

  static final List<Project> featuredProjects = [
    Project(
      title: 'Eco-Drone Delivery',
      creator: 'Alice Smith',
      price: 150.0,
      description: 'Drones para entrega sostenible.',
      imageUrl: 'https://picsum.photos/seed/drone/400/300',
    ),
    Project(
      title: 'IA para Agricultura',
      creator: 'Bob Johnson',
      price: 320.5,
      description: 'Optimización de cultivos con IA.',
      imageUrl: 'https://picsum.photos/seed/agri/400/300',
    ),
    Project(
      title: 'Plataforma EduTech 3.0',
      creator: 'Carlos Ruiz',
      price: 85.0,
      description: 'Aprende a programar jugando.',
      imageUrl: 'https://picsum.photos/seed/edu/400/300',
    ),
    Project(
      title: 'Coches Solares Urbanos',
      creator: 'Diana Prince',
      price: 540.0,
      description: 'Vehículos para el día a día.',
      imageUrl: 'https://picsum.photos/seed/car/400/300',
    ),
    Project(
      title: 'Clean Water Initiative',
      creator: 'Evan Wright',
      price: 210.0,
      description: 'Purificación de agua en zonas remotas.',
      imageUrl: 'https://picsum.photos/seed/water/400/300',
    ),
  ];

  static final List<Project> myProjects = [
    Project(
      title: 'Mi StartUp FinTech',
      creator: 'Elon Musk',
      price: 120.0,
      description: 'Innovando las finanzas personales.',
      imageUrl: 'https://picsum.photos/seed/fintech/400/300',
    )
  ];

  static final List<Course> myCourses = [
    Course(title: 'Introducción a Inversiones', progress: 0.8),
    Course(title: 'Análisis Fundamental', progress: 0.4),
    Course(title: 'Economía de Startups', progress: 0.1),
  ];
}

class User {
  final String name;
  final int level;
  final double balance;
  final double totalInvestment;
  final String profileImageUrl;

  User({
    required this.name,
    required this.level,
    required this.balance,
    required this.totalInvestment,
    required this.profileImageUrl,
  });
}

class Project {
  final String title;
  final String creator;
  final double price;
  final String description;
  final String imageUrl;

  Project({
    required this.title,
    required this.creator,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

class Course {
  final String title;
  final double progress;

  Course({
    required this.title,
    required this.progress,
  });
}
