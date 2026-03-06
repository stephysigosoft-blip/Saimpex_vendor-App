# Vendor App API Requirements (Revised)

## General Clarifications

1. **Order details endpoint clarification:**  
   Confirm whether `restaurantOrderDetail?order_id={id}` is shared for both restaurant and grocery orders, or if separate endpoints are required.

2. **Restaurant vs grocery API separation:**  
   Clearly indicate which APIs are shared and which must be maintained separately for restaurant and grocery modules.

## Order Module

3. **Accept Order API is missing.**

4. **Reject Order API is missing.**

5. **Order Preparation Started API is missing.**

6. **Mark as Ready API is missing.**

7. **Order View All API is missing.**  
   Required query parameters: `status`, `limit`, `page`, `keyword` (for search).

8. **Order details response updates required:**  
   - Add user address latitude and longitude.  
   - Include delivery boy image.  
   - Refactor `order_items` to: `name`, `quantity`, `price`, `image`.  
   - Remove unnecessary keys from the response.

9. **Order status timeline response must be simplified.**  
   Prefer explicit boolean values (`true` / `false`) for each stage.

## Dashboard & Notifications

10. **Notification listing API is missing.**

11. **Dashboard API update required:**  
    Endpoint: `{{local}}dashboard?vendor_type=1&revenue_year=2025`  
    - Today’s orders are missing.  
    - Remove unnecessary keys from the response.

## Account, Session, and Profile

12. **Restaurant account details API is missing.**

13. **`fetchUserData` response needs expansion** to match UI requirements.

14. **Delete account API is missing.**

15. **Logout API is missing.**

## Leave & Staff

16. **Mark leave API is missing.**

17. **Cancel leave API is missing.**

18. **Delivery boy listing API is missing.**

## Ratings, Reviews, and Customers

19. **Ratings and reviews API (View All) is missing.**

20. **Redeemed customers listing API is missing.**

21. **Received payout listing API is missing.**

## Menu & Item Management

22. **Restaurant menu item listing API needs additional parameters.**  
    Add: `sort`, `filter`, `keyword` (search).

23. **Menu APIs are missing:**  
    - Add menu item  
    - Edit menu item  
    - Delete menu item

24. **Menu view details API is missing.**

25. **Item APIs are missing:**  
    - Add item  
    - Edit item  
    - Item listing  
    - Item details

26. **Menu bulk import API is missing.**

27. **Basket APIs are missing:**  
    - Basket listing  
    - Basket detail view

## Communication

28. **Chat module APIs are missing.**
