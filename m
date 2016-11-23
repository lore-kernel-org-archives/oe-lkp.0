Content-Type: multipart/mixed; boundary="===============6706023520786881601=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 34fad54c25: kernel BUG at include/linux/skbuff.h:1935!
Date: Wed, 23 Nov 2016 16:36:39 +0800
Message-ID: <20161123083639.h6wuxh33jejpk4ln@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFx9q2xi1oi2j5QcYhMV490oj9CQ4N_OEXzC-3b6GeUQug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6706023520786881601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 11:07:16PM -0800, Linus Torvalds wrote:
>On Tue, Nov 22, 2016 at 10:44 PM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
>>
>> On Tue, Nov 22, 2016 at 02:04:42PM -0800, Linus Torvalds wrote:
>>
>>> I also noticed that the kernel test robot had screwed up the
>>> participants list for some reason, and had
>>>
>>>  "Acked-by: Alexander Duyck <alexander.h.duyck@intel.com>, David S.
>>> Miller" <davem@davemloft.net>
>>>
>>> as one of the participants. So there's some odd commit parsing issue
>>> there somewhere. But Alexander seems to have seen this report despite
>>> that, it just never went anywhere that I can tell.
>>
>>
>> Yeah the robot will CC all "Acked-by" people in the bug reports.
>>
>> Shall we limit it to the below TO/CC list?
>
>No. We do want to keep the Acked-by's on the cc.
>
>But you missed the real problem.
>
>It *didn't* cc the acked-by. Look closer. What happened was that it cc'd t=
his:
>
> "Acked-by: Alexander Duyck <alexander.h.duyck@intel.com>, David S. Mill=
er"
>
> <davem@davemloft.net>
>
>ie there is only _one_ email address (that of davem(a)davemloft.net),
>and the whole "Acked-by: Alexander Duyck <...>" part is quoted as the
>_name_ of that email address.
>
>At least that's what the headers look like for me in the original report:
>
>   From: kernel test robot <xiaolong.ye@intel.com>
>   To: Eric Dumazet <edumazet@google.com>
>   Cc: lkp(a)01.org, Linus Torvalds <torvalds@linux-foundation.org>,
>LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov
><ast@kernel.org>, Willem de Bruijn <willemb@google.com>, "Acked-by:
>Alexander Duyck <alexander.h.duyck@intel.com>, David S. Miller"
><davem@davemloft.net>
>
>Notice the quoting of that last "name".

Ah thanks! Xiaolong just root caused the parse error and will fix it.

Interestingly we didn't see that problem -- the CC list looks correct
in our emails -- perhaps Intel's email system auto fixed up the header.

Thanks,
Fengguang

--===============6706023520786881601==--

