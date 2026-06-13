/*
 * sfe_timer_compat.h
 *	Shortcut forwarding engine timer compatibility helpers.
 */

#ifndef SFE_TIMER_COMPAT_H
#define SFE_TIMER_COMPAT_H

#include <linux/version.h>
#include <linux/timer.h>

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 18, 0))
#define sfe_from_timer(var, callback_timer, timer_fieldname) \
	timer_container_of(var, callback_timer, timer_fieldname)
#define sfe_timer_delete_sync(timer) timer_delete_sync(timer)
#else
#define sfe_from_timer(var, callback_timer, timer_fieldname) \
	from_timer(var, callback_timer, timer_fieldname)
#define sfe_timer_delete_sync(timer) del_timer_sync(timer)
#endif

#endif /* SFE_TIMER_COMPAT_H */
