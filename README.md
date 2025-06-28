# UCCD Courses Management System

[![Flutter](https://img.shields.io/badge/Flutter-3.10%2B-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue?logo=dart)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A modern, feature-rich courses management platform built for the University Center for Career Development (UCCD) at Bani Sweif Technological University (BSTU). This app provides a seamless and secure experience for managing university courses, enrollment, and internal communication—complete with a stunning UI and robust role-based access.

---

## 🏷️ Tags

`#courses-management` `#university` `#bstu` `#UCCD` `#firebase-auth` `#role-based-access` `#admin-dashboard`  
`#student-portal` `#internal-community` `#analytics` `#attendance` `#certificate-management` `#modern-ui`  
`#education` `#career-development` `#flutter` `#dart` `#MIT-license`

---

## 🌟 Project Overview

This platform is designed to digitalize and streamline the career development courses at BSTU. It enables the university to manage courses, track enrollments, conduct interviews, handle certificates, and facilitate communication—all while ensuring security and ease of use for different user types.

> **Key Characteristics:**
> - Secure login with university email (BSTU only, via Firebase Auth)
> - Four distinct user roles with clear permissions
> - Powerful admin dashboard and analytics
> - Internal announcement and community board
> - Modern, responsive user interface

---

## 🔑 Authentication & Security

- **Firebase Authentication:**  
  Only BSTU (Bani Sweif Technological University) emails are allowed to register and log in. This prevents unauthorized access and ensures only legitimate university members can use the app.
- **Role-based Access Control:**  
  Each user is assigned a role (Super Admin, Admin, Instructor, Student), and only sees features and data relevant to that role.

---

## 👤 User Roles & Permissions

### 1. **Super Admin**
- **Platform Owner:** Has the highest privileges.
- **User Management:** Can create, update, and delete all types of users (Admins, Instructors, Students).
- **Category Management:** Manages all course categories and departments.
- **Logs & Auditing:** Accesses comprehensive activity logs for all admins.
- **Full CRUD:** Can create, edit, and delete any resource in the system.
- **Community:** Can make announcements or posts visible to the community.

### 2. **Admin**
- **Course Management:**  
  - Create, edit, and delete courses.
  - Assign instructors to courses.
- **Enrollment & Interview Process:**  
  - View all applicants for a course.
  - Accept or reject students after interviews.
  - Track enrollment status: enrolled, rejected, or pending interview.
- **Statistics & Analytics:**  
  - See numbers of enrolled, rejected, and pending students.
  - View breakdown by departments and academic years.
  - Analyze which department/year has most enrollments.
- **Course Completion:**  
  - See student ratings for finished courses.
  - Notify students when certificates are issued.
- **Community:**  
  - Make announcements about events, delays, or news.
- **Note:** Cannot manage users or view admin logs.

### 3. **Instructor**
- **Assigned Courses:**  
  - View details and enrolled students for assigned courses.
- **Attendance:**  
  - Take daily attendance of enrolled students.
- **Upload Materials:**  
  - (Upcoming feature) Share lecture notes, assignments, and materials.
- **Community:**  
  - Post updates and interact with students regarding courses.

### 4. **Student**
- **Course Discovery:**  
  - Browse and apply for available courses.
- **Enrollment Tracking:**  
  - See status of each application (pending, accepted, rejected).
- **Course Participation:**  
  - Access enrolled courses, see attendance, and receive notifications.
- **Certificate Notifications:**  
  - Receive alerts when certificates are issued after course completion.

---

## 🏫 Internal Community Board

A built-in announcement and discussion feature for Super Admins, Admins, and Instructors to:
- Post about events, course delays, or important updates.
- Share opportunities, reminders, or news with students.
- Foster engagement and communication within BSTU.

---

## 📈 Analytics & Statistics

- **Admins** can view dashboards showing:
  - Enrollment numbers per course.
  - Percentage of accepted, rejected, and pending students.
  - Department and year-wise breakdown of enrollments.
  - Ratings and feedback after course completion.

- **Super Admins** see additional system-level analytics and admin activity logs.

---

## ✨ User Experience

- **Stunning UI:** Clean, intuitive interfaces designed for ease of use.
- **Role-based Dashboards:** Each user role has a unique dashboard tailored to their needs.
- **Responsive Design:** Works on desktop, tablet, and mobile.

---

## 📦 Tech Stack

- **Frontend & Mobile:** Flutter (Dart)
- **Backend:** [Laravel,Firebase]
- **Authentication:** Firebase Auth (with university email domain restriction)
- **Database:** [e.g., Firestore or Realtime Database]

---

## 🚦 Typical User Flow

### For Students:
1. **Register/Login** with BSTU email.
2. **Browse Courses** and apply for interesting ones.
3. **Attend Interview** (if required).
4. **Track Application Status** (pending, accepted, rejected).
5. **Join Course** if accepted.
6. **Receive Certificate Notification** after passing.

### For Admins:
1. **Login** and access dashboard.
2. **Create/Edit Courses** and assign instructors.
3. **Monitor Applications** and conduct interviews.
4. **Accept/Reject Students** and track statistics.
5. **Announce Events/Updates** via the community board.

### For Instructors:
1. **Login** and see assigned courses.
2. **Take Attendance** for each session.
3. **(Future) Upload Materials** for students.

### For Super Admins:
- **Full control** over users, courses, categories, and system logs.

---

## 🛠️ Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AhmedAbdElrahman117/uccd.git
   cd uccd
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Configure Firebase:**
   - Add your Firebase project configuration to the `/android`, `/ios`, and `/web` directories as appropriate.
   - Restrict authentication to BSTU university emails in Firebase Console.
4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 🏗️ Future Work

- Instructor material upload and sharing.
- More detailed analytics and reporting.
- Enhanced notification system and certificate management.
- Community post comments and reactions.
- Mobile app support.

---

## 📄 License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Please open issues and submit pull requests for new features or bug fixes.

---

## 📬 Contact

For questions or support, contact [AhmedAbdElrahman117](mailto:your.email@bstu.edu.eg).
