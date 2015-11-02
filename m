Content-Type: multipart/mixed; boundary="===============7227877372951594758=="
MIME-Version: 1.0
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs] df4c0e36f1: NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Tue, 03 Nov 2015 00:29:36 +0300
Message-ID: <CAPAsAGxTv8dhaFF2KPJEq99THi874+kET1FNWoTUAh8FyYqD6A@mail.gmail.com>
In-Reply-To: <5637C288.9070508@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7227877372951594758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-11-02 23:07 GMT+03:00 Dave Hansen <dave.hansen@intel.com>:
> On 11/02/2015 11:34 AM, Andrey Ryabinin wrote:
>>>> >>
>>>> >> [    1.159450] augmented rbtree testing -> 23675 cycles
>>>> >> [    1.864996]
>>>> >> It took less than a second, meanwhile in your case it didn't finish=
 in
>>>> >> 22 seconds.
>>>> >>
>>>> >> This makes me think that your host is overloaded and the problem is=
 on
>>>> >> your side.
>>> >
>>> > It's probably just a matter of putting some cond_resched()s in the te=
st
>>> > code.
>> Yes, but is it worthwhile? It's very likely that lockup will just
>> trigger in another place.
>
> I'm guessing that the lockup here was because the tests were running for
> too long.  If we cond_resched() in there often enough, the kernel won't
> detect a softlockup at all.

Sure, but why are these tests running so long?
In my setup it takes less than a second to finish these tests.
On the same kernel version and config of course. Although I might have more
powerful hardware it doesn't explain such huge difference.
So these tests are actually fast tests. I guess that  the host is
overloaded and KVM guest runs
so slow that even these simple tests start triggering softlockup.

> It won't shift somewhere else.

That's not what I mean. Sure, the cond_resched() in rbtree_test_init()
will fix this particular softlockup.
But if even such normally fast tests now are running too long, then a
lot of other kernel code, which normally
runs fast, likely becomes too slow on Ying's setup and will trigger
another softlockup.
rbtree_test_init() is just the first such place.
In that case, sticking cond_resched()s across the whole kernel is not
a solution.

--===============7227877372951594758==--

