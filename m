Content-Type: multipart/mixed; boundary="===============5552615650042641807=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm] WARNING: CPU: 0 PID: 105 at kernel/sched/core.c:7094 __might_sleep()
Date: Sun, 10 Aug 2014 22:47:54 -0400
Message-ID: <CAPDOMVjJVWrLz9VkeHjRZVEAt8K+eDR4u4swGvADDzP3b+izBg@mail.gmail.com>
In-Reply-To: <20140809045244.GA22456@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5552615650042641807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 9, 2014 at 12:52 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Nick,
>
>> Fenguang,
>> Just asking , is this a new trace or are you reminding our or another
>> older trace you did a few months
>> back. If it isn't I will be glad to trace this for you and the maintaine=
rs.
>> Regards Nick
>
> It's a new trace. However should be an old problem newly disposed by
> Peter's debug patch.
>
> Thanks,
> Fengguang
Fenguang,
The issue seems to be pretty obvious after tracing. The issue seems to
we are in an IRQ.
I am stating the trace below for you to follow.
Cheers Nick
1. We are first in the function,  rfcomm_run as it's running on a kernel th=
read
2. After reading your trace we do successfully get through this
function. rfcomm_check_accept
3. Logically if this passes the while loop should as the rfcomm
listener  is good and able to run with
schedule
4. After the while loop we hit the function that kills the rfcomm
listener. rfcomm_kill_listener();
5. After looking into rfcomm_kill_listener we have a function to kill a tim=
er,
rfcomm_session_clear_timer(s); on a linked list of struct rfcomm_session
6. We then trace in to the called function which internally calls only,
del_timer_sync(&s->timer); on the linked list timer(s)
7. I then traced this to the internal function called which of course
is del_timer_sync
8. We then hit a WARN ON, which makes sense in this function
I am assuming I am wrong here as I couldn't find the commit, you sent
in your around email :(.
Regards Nick

--===============5552615650042641807==--

