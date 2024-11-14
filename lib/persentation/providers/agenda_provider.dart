import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'agenda_provider.g.dart';

@riverpod
String agenda(Ref ref, {int day = 1}) => day == 1
    ? '''
## Day 1: Emerging Technologies

### Morning Session
- *9:00 AM - 9:30 AM*: Registration and Welcome Coffee
- *9:30 AM - 10:30 AM*: Keynote: The Future of AI and Machine Learning
- *10:30 AM - 11:00 AM*: Coffee Break

### Midday Session
- *11:00 AM - 12:00 PM*: Workshop: Introduction to Quantum Computing
- *12:00 PM - 1:00 PM*: Panel Discussion: Blockchain Beyond Cryptocurrency

### Lunch
- *1:00 PM - 2:00 PM*: Networking Lunch

### Afternoon Session
- *2:00 PM - 3:00 PM*: Breakout Sessions (Choose one):
  - Cybersecurity Trends
  - IoT and Smart Home Technologies
- *3:00 PM - 3:30 PM*: Coffee Break
- *3:30 PM - 4:30 PM*: Closing Keynote: Ethics in Technology

### Evening
- *5:00 PM - 7:00 PM*: Networking Mixer
'''
    : '''
## Day 2: Software Development and Best Practices

### Morning Session
- *9:00 AM - 9:30 AM*: Welcome Back and Coffee
- *9:30 AM - 10:30 AM*: Keynote: The Evolution of Web Development
- *10:30 AM - 11:00 AM*: Coffee Break

### Midday Session
- *11:00 AM - 12:00 PM*: Workshop: Agile and Scrum Masterclass
- *12:00 PM - 1:00 PM*: Panel Discussion: The Rise of DevOps

### Lunch
- *1:00 PM - 2:00 PM*: Networking Lunch

### Afternoon Session
- *2:00 PM - 3:00 PM*: Breakout Sessions (Choose one):
  - Introduction to Docker and Kubernetes
  - Building RESTful APIs with Node.js
- *3:00 PM - 3:30 PM*: Coffee Break
- *3:30 PM - 4:30 PM*: Closing Keynote: The Importance of UX/UI Design in Software Development

### Closing
- *4:30 PM - 5:00 PM*: Closing Remarks and Conference Wrap-up
''';
