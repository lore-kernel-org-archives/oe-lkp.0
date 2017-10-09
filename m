Content-Type: multipart/mixed; boundary="===============2107337891694249410=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locking] 892ad5acca [ 12.849409] WARNING: bad unlock balance detected!
Date: Mon, 09 Oct 2017 16:24:25 -0700
Message-ID: <CA+55aFyNXitPT9vriRPyrNsVbFFpgVkkCxFSxjKBgfPm=t01dQ@mail.gmail.com>
In-Reply-To: <20171009155536.nunzqpzfb5jcbaqd@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2107337891694249410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 8:55 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
>
> 0day kernel testing robot got the below dmesg and the first bad commit is

This makes no sense.

> [   12.849409] WARNING: bad unlock balance detected!
> [   12.850157] 4.12.0-00420-g892ad5a #1 Not tainted
> [   12.850870] -------------------------------------
> [   12.851574] rhashtable_thra/109 is trying to release lock (rcu_preempt=
_state) at:
> [   12.852701] [<ffffffff811087c8>] rcu_read_unlock_special+0x3de/0x4a7
> [   12.853707] but there are no more locks to release!

The only RCU release is in the inlined rhashtable_lookup_fast(), but
that one looks trivially and obviously correct. It literally just does

        rcu_read_lock();
        obj =3D rhashtable_lookup(ht, key, params);
        rcu_read_unlock();

> [   12.864927]  rcu_read_unlock_special+0x3de/0x4a7
> [   12.865660]  __rcu_read_unlock+0x62/0x9f
> [   12.866262]  thread_lookup_test+0x400/0x50b
> [   12.866911]  threadfunc+0x84f/0x8e0

.. so I'm wondering if there's something wrong in the test harness, or
some *serious* issue that causes RCU state to do the wrong thing over
preemption or with unlucky interrupt timing.

Because that thread_lookup_test() thing really is so trivial as to say
the problem is not in the caller.

Adding Paul to the cc list. Was there some known problem during the
4.13 merge window that could have caused this?

The fact that it came in with the locking merge might also just mean
that it's a bug in the locking balance detection, presumably
interacting badly with something else.

There *is* another email (from Sebastian Andrzej Siewior) that shows
that same "WARNING: bad unlock balance detected", with the subject
line "RCU boosting and lockdep are not playing nice", and that one
blames commit cde50a67397c ("locking/rtmutex: Don't initialize lockdep
when not required").

Maybe this was already fixed elsewhere, but I'm not seeing any replies
to that other email either (it was send back in mid-August).

Oh, and I see that the 0day robot also fingered that commit
cde50a67397c in _another_ report, so it's just this one that seems to
have oddly bisected to the locking merge. Presumably it's all the same
thing, just in two different guises.

                    Linus

--===============2107337891694249410==--

