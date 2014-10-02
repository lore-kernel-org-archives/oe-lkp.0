Content-Type: multipart/mixed; boundary="===============4960253161560276273=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 15:49:05 -0400
Message-ID: <542DAC31.8030504@hurleysoftware.com>
In-Reply-To: <20141002191114.GA30606@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4960253161560276273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/02/2014 03:11 PM, Oleg Nesterov wrote:
> On 10/02, Peter Zijlstra wrote:
>>
>> On Thu, Oct 02, 2014 at 03:52:50PM +0200, Peter Zijlstra wrote:
>>>> If yes, then wakeups from signals don't work either, right?
>>>
>>> Its a kthread, there should not be any signals.
>>
>> That said, in the tty patch we do appear to have this problem.
>>
>> Oleg, do we want something like the below on top to make that work
>> again?
>>
>> ---
>> --- a/kernel/sched/wait.c
>> +++ b/kernel/sched/wait.c
>> @@ -326,8 +326,10 @@ long wait_woken(wait_queue_t *wait, unsi
>>  	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
>>  	 * also observe all state before the wakeup.
>>  	 */
>> -	if (!(wait->flags & WQ_FLAG_WOKEN))
>> -		timeout =3D schedule_timeout(timeout);
>> +	if (!(wait->flags & WQ_FLAG_WOKEN)) {
>> +		if (___wait_is_interruptible(mode) && !signal_pending_state(mode, cur=
rent))
>> +			timeout =3D schedule_timeout(timeout);
>> +	}
>>  	__set_current_state(TASK_RUNNING);
> =

> I am a bit confused... but for what?
> =

> schedule() won't sleep if signal_pending_state(mode) anyway, so we
> do not need this correctness-wise. And the caller needs to check
> signal_pending() anyway.
> =

> We can probably add
> =

> 	if (signal_pending_state(mode, current))
> 		return -EINTR;
> =

> at the start of wait_woken(), even before set_current_state(mode).
> Then the caller can check "ret < 0" and avoid signal_pending().
> Not sure this makes sense.

The confusion is my fault; I see now that signals don't suffer from the
missed wakeup problem to which other condition testing is prone. Thanks
for setting me straight, Oleg.

So just back to the kthread wakeup problem then.

Regards,
Peter Hurley




--===============4960253161560276273==--

