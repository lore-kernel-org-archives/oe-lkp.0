Content-Type: multipart/mixed; boundary="===============1219282443004540539=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: Re: [crypto] BUG: unable to handle kernel paging request at ffff88000bb88000
Date: Mon, 30 Jun 2014 13:38:55 +0000
Message-ID: <1485256.DS9rzaQkMP@tauon>
In-Reply-To: <20140630053126.GA13887@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1219282443004540539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Montag, 30. Juni 2014, 13:31:26 schrieb Fengguang Wu:

Hi Fengguang,

>Hi Stephan,
>
>On Sun, Jun 29, 2014 at 09:45:48PM +0200, Stephan Mueller wrote:
>> Am Sonntag, 29. Juni 2014, 22:52:46 schrieb Fengguang Wu:
>> =

>> Hi Fengguang,
>> =

>> > Greetings,
>> > =

>> > 0day kernel testing robot got the below dmesg and the first bad
>> > commit is> =

>> May I ask whether there is anything special in your kernel config?
>
>It's an x86_64 randconfig. You may find it in the attachment of the
>original report email.

Thanks, I used that config. I was just wondering whether there were some =

special config options that changed the memory allocation mechanism. The =

kernel configs I used never triggered the issue albeit it should have =

had.

I ran stress tests months ago (with the bug present) where I invoked the =

DRBG for one day, causing billions of rounds of RNG operation where each =

round should have triggered the bug.
>
>> This very bug should have been triggered already in all previous code
>> levels! I am seriously wondering why this bug was not triggered
>> before -- does kalloc somehow allocates more memory than you
>> requested? And only your specific kernel config made kalloc to
>> allocate the exact amount of memory that was requested?
>
>Yeah the bug may have been triggered in other places. If you see
>anything valuable from this bisect result, it would be great. Judging
>from the comparison of 64d1cdfbe2 and its parent commit 3332ee2a17,
>it's pretty reproducible, so easy to verify the possible fixes.

Well, it is not so reproducible as you may think. And I as far as I can =

see the other oops that you send was caused by the same issue.

When I was debugging the issue and just adding some printk statements, =

the crasher went away (reliably) or it crashed at some other random =

places. It was very bizarre. But after adding my fix, I did not see any =

crash any more.

Ciao
Stephan

--===============1219282443004540539==--

