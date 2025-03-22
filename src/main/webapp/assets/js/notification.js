
let currentOffset = 0;
let limit = 10;
var page = 0
async function fetchNotifications(page) {

	try {
		const response = await fetch(`${contextPath}/getNotificationList?page=` + page.toString(), {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json'
			}
		});
		if (!response.ok) {
			throw new Error('Failed to fetch notifications');
		}
		const data = await response.json();
		return data;
	} catch (error) {
		console.error('Error fetching notifications:', error);
		return []; // Return an empty array if there's an error
	}

}
function createNotificationItems(data) {
	const listFragment = document.createDocumentFragment();
	const now = new Date();

	data.forEach(item => {
		const li = document.createElement('li'); // Create a list item
		li.className = `dropdown-list-item ${item.isRead ? 'unread' : ''}`;
		li.style.cursor = 'default';

		const div = document.createElement('div'); // Create a div for the dropdown item
		div.className = 'dropdown-item';

		const p = document.createElement('p'); // Create a paragraph for the notification body
		p.textContent = item.title;
		p.style.textWrap = "balance";// Ensures that long words will wrap to the next line

		const notificationLine = document.createElement('div'); // Create a div for the notification line
		notificationLine.className = 'notification-line-2 justify-content-end';

		// Calculate time difference
		const itemDate = new Date(item.createdOn);
		const diffTime = now - itemDate;
		const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24)); // Days difference

		let timeAgoText;
		if (diffDays === 0) {
			// Less than 1 day ago, show time difference in hours or minutes
			const diffHours = Math.floor(diffTime / (1000 * 60 * 60));
			if (diffHours >= 1) {
				timeAgoText = `${diffHours} hour${diffHours > 1 ? 's' : ''} ago`;
			} else {
				const diffMinutes = Math.floor(diffTime / (1000 * 60));
				timeAgoText = `${diffMinutes} minute${diffMinutes > 1 ? 's' : ''} ago`;
			}
		} else {
			// More than 1 day ago, format as "Day of the week, Day Month, time AM/PM"
			const options = { weekday: 'short', day: 'numeric', month: 'short', hour: 'numeric', minute: 'numeric' };
			timeAgoText = itemDate.toLocaleDateString('en-US', options);
		}

		const spanTime = document.createElement('span'); // Create a span for the time
		spanTime.textContent = timeAgoText;

		// Append spans to the notification line
		notificationLine.appendChild(spanTime);

		// Append elements to the dropdown item div
		div.appendChild(p);
		div.appendChild(notificationLine);

		// Append the dropdown item div to the list item
		li.appendChild(div);

		// Append the list item to the fragment
		listFragment.appendChild(li);
	});

	return listFragment;
}

async function loadNotifications(page) {
	const notificationList = document.getElementById('notification-list');

	// Check if initial notification template is already added
	if (notificationList.children.length === 0) {
		const initialNotificationTemplate = `
      <li class="dropdown-list-item" style="position: sticky; top: 0;">
        <div class="dropdown-item">
          <div>
            <span>Notification</span>
          </div>
          <div>
          
          </div>
        </div>
      </li>
    `;
		notificationList.innerHTML = initialNotificationTemplate;
	}

	const notifications = await fetchNotifications(page);
	fetchUnreadNotificationCount();

	if (notifications.length === 0) {
		
		// Add "Show More" button if needed
		const showMoreItem = document.createElement('li');
		showMoreItem.className = 'dropdown-list-item ';
		showMoreItem.innerHTML = `
      <div class="dropdown-item">
        <div>
          <span class="">No notifications available.</span>
        </div>
      </div>
    `;
		notificationList.appendChild(showMoreItem);
	} else {
		const notificationItems = createNotificationItems(notifications);
		notificationList.appendChild(notificationItems);
		currentOffset += limit;

		// Add "Show More" button if needed
		const showMoreItem = document.createElement('li');
		showMoreItem.className = 'dropdown-list-item show-more-button';
		showMoreItem.innerHTML = `
      <div class="dropdown-item">
        <div class="show-more-button">
          <span class="show-more-button">Show More</span>
        </div>
      </div>
    `;
		notificationList.appendChild(showMoreItem);
	}
}

document.getElementById('fetch-notifications').addEventListener('click', (event) => {
	// Check if the clicked element has a class of "show-more-button"
	if (event.target && (event.target.matches('.show-more-button')||(event.target.matches('.dropdown-list-item.show-more-button')))) {
		currentOffset = limit
		page++

		loadNotifications(page)  
		let closestLi = event.target.closest('li.dropdown-list-item');
		if (closestLi) {
			closestLi.style.display = 'none';
		}
	} else if (event.delegateTarget && (event.delegateTarget.id === 'openNotification'||event.delegateTarget.id === 'openMobileNotification')) {
		document.getElementById('notification-list').innerHTML = ''; // Clear existing notifications
		currentOffset = 0;
		loadNotifications(page);
	}


});


// Function to fetch unread notification count
function fetchUnreadNotificationCount() {
	fetch(contextPath + "/unReadNotificationCount", {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.then(data => {
			// Assuming the API returns data like { count: 5 }
			var unreadCount = data.unReadCount || 0;

			// Update the DOM if there are unread notifications
			if (unreadCount > 0) {
				document.getElementById('bellIcon').src = `${contextPath}/assets/icons/Notification red Badge.svg`;

			} else {
				document.getElementById('bellIcon').src = `${contextPath}/assets/icons/bell.svg`;

			}
		})
		.catch(error => {
			console.error('Error fetching unread notification count:', error);
		});
}

// Call the function when the page loads
document.addEventListener('DOMContentLoaded', fetchUnreadNotificationCount);


