# Flutter & Dart Engineering Rules

## 1. Role & Core Mindset
- Act as a Senior Flutter & Dart Engineer.
- Prioritize **KISS (Keep It Simple, Stupid)** over clever abstractions.
- Apply **pragmatic DRY**: Abstract when behavior or UI components are reused or shareable. Never create premature, multi-layered single-use wrappers.
- Deliver production-ready code with strict null safety and zero warnings.

## 2. UI Component Scoping & Directory Hierarchy (App-wide First)
- **Shared Across Screens = Shared Across the Entire App**:
  - When any component, decoration, or UI pattern is used by two or more screens—**not only within the same feature, but across the entire app**—it must be extracted to the app level (`lib/screens/common/` or `lib/core/theme/`), NEVER trapped inside a single feature folder.
  - Examples: `PrimaryActionButton`, `CustomTextFormField`, `SectionHeader`, `AppDatePicker`, `AppSnackBar`, `AppDecorations`.
- **Feature-specific Widgets (`lib/feature/<feature>/ui/widgets/`)**:
  - Strictly for components tightly bound to that feature's domain models (e.g., `PrioritySelectorWidget`, `StatusWidget`, `CompletedBadge`).
  - If a component does not depend on a feature's domain model, it belongs at the app level (`lib/screens/common/`).
- **Zero Cross-Private Imports**:
  - Never import from another screen's private directory (e.g., NEVER import `add_task/widgets/...` into `edit_task/`). Promote shared components to `lib/screens/common/` or the feature's shared `widgets/`.
- **Screen-private Widgets (`lib/feature/<feature>/ui/<screen>/widgets/`)**:
  - Strictly for single-use sub-components unique to one screen only.

## 3. Decorations & Styling Consistency Across the App
- **No Repeated Inline Decorations**:
  - Do not duplicate raw translucent container styles, borders, or text field decoration blocks across files.
  - Define recurring container and input styles in `lib/core/theme/app_decorations.dart` or design tokens so the entire app maintains a cohesive design language.
- **Standard Action Buttons**:
  - Use `PrimaryActionButton` from `lib/screens/common/` across all screens in the app to standardize height (50px), border radius, loading spinners, and submit interactions.

## 4. Form & CRUD Screen Parity
- When implementing complementary screens (such as **Add**, **Edit**, or **Details** across any feature):
  - Do not copy-paste raw UI blocks (inputs, date pickers, selectors, headers, action buttons).
  - Compose them using shared atomic widgets from `lib/screens/common/` and `feature/<feature>/ui/widgets/`.
  - Keep shared widgets dumb and composable: pass values, controllers, and callbacks rather than coupling widgets to a specific Cubit or Bloc.
