# Mini TaskHub – Personal Task Tracker (Flutter + Supabase)

Mini TaskHub is a personal task management application built using **Flutter** and **Supabase**.  
It allows users to securely log in, manage their daily tasks, and track progress through a clean and modern UI.

This project was built as part of an assignment to demonstrate end-to-end Flutter app development, including authentication, database integration, state management, and responsive UI design.

---

## Features

- Email & password authentication using Supabase  
- Create, complete, and delete personal tasks  
- Dashboard with task overview  
- Chat, Calendar, and Notifications UI screens  
- Add Task modal using bottom sheet  
- Real-time task updates (Supabase)  
- Modern dark UI with consistent theming  
- Provider for state management  

---

## Tech Stack

- **Flutter** (Frontend)
- **Supabase** (Authentication & Database)
- **Provider** (State Management)

---

## Screens Included

- Login  
- Sign Up  
- Dashboard (Tasks)  
- Chat  
- Calendar  
- Notifications  
- Add Task Modal  

---

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/chinmayy13/mini-taskhub-flutter.git
cd mini-taskhub-flutter
```
## Install Dependencies

```flutter pub get```

## Supabase Setup
Create a Supabase Project
- Go to https://supabase.com
- Create a new project
- Enable Email authentication (enabled by default)

Create ```tasks``` Table
Go to SQL Editor in Supabase and run:

```bash
create table tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  title text not null,
  is_completed boolean default false,
  created_at timestamp with time zone default now()
);
```

Enable Row Level Security (RLS)
```
alter table tasks enable row level security;
```

Add Policies
```
create policy "Users can view their tasks"
on tasks for select
using (auth.uid() = user_id);

create policy "Users can insert their tasks"
on tasks for insert
with check (auth.uid() = user_id);

create policy "Users can update their tasks"
on tasks for update
using (auth.uid() = user_id);

create policy "Users can delete their tasks"
on tasks for delete
using (auth.uid() = user_id);
```

### Add Supabase Credentials

Open ```lib/main.dart``` and replace:
```bash
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_ANON_PUBLIC_KEY',
);
```

You can find these values in:
```
Supabase Dashboard → Project Settings → API
```

## Run the App
```
flutter run
```

## Hot Reload vs Hot Restart
- Hot Reload
    Updates UI instantly without losing app state.
    Used for quick UI changes.

-  Hot Restart
    Rebuilds the app from scratch and clears state.
    Used when state or providers change.


## Project Structure
```
lib/
├── auth/           # Login & Signup
├── dashboard/      # Dashboard UI
├── chat/           # Chat UI
├── calendar/       # Calendar UI
├── notifications/  # Notifications UI
├── models/         # Data models
├── services/       # Supabase services
├── providers/      # State management
├── widgets/        # Reusable widgets
├── shell/          # Bottom navigation shell
└── main.dart       # App entry point
```


### Author
Built by Chinmay
Flutter | Supabase | Full-Stack Enthusiast
