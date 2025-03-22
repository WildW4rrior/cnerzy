
function openTimeLine(row,result) {
	if (row) {
		projectId = row.id;
	}


	
			const timelineData = result
			const now = new Date();
			let timelineHtml = '';

			Object.keys(timelineData).forEach(key => {
				const itemDate = timelineData[key] ? new Date(timelineData[key]) : null;
				const isCompleted = itemDate && itemDate <= now;
				const diffDays = itemDate ? Math.floor((now - itemDate) / (1000 * 60 * 60 * 24)) : '';

				timelineHtml += `
                    <div class="timeline-item ${isCompleted ? 'completed' : ''}" data-key="${key}">
                        <div class="icon"></div>
                        <div class="text">${key}</div>
                        <div class="date">
                            ${itemDate ? `${itemDate.toDateString()}<br>(${diffDays} days ago)` : ''}
                        </div>
                    </div>
                `;
			});

			const timelineContainer = document.getElementById('timelineModal');

			timelineContainer.innerHTML = timelineHtml;

			if (row) {
				projectId = row.id;
				$("#timeline").modal("show");
				$("#timeline #projectId").html(row.reqUniqueCode);
			}
}
