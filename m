Content-Type: multipart/mixed; boundary="===============8849897231115486367=="
MIME-Version: 1.0
From: Kleen, Andi <andi.kleen@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 19:42:45 +0000
Message-ID: <E8ECBC65D0B2554DAD44EBE43059B3740F2AA1@ORSMSX110.amr.corp.intel.com>
In-Reply-To: <CAHk-=wjkSb1OkiCSn_fzf2v7A=K0bNsUEeQa+06XMhTO+oQUaA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8849897231115486367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>Does anybody else have any ideas?

We've had problems with atomics having strange ordering constraints before.

But it might be c2c missing the right cache line. There are some known case=
s where that can happen.

Feng, can you double check with =


perf record -a -d -e mem_load_l3_hit_retired.xsnp_hitm:pp,mem_load_l3_miss_=
retired.remote_hitm:pp ...

Does it report the same hot IPs as c2c?
What's the break down between the first and the second event for the hot IP=
s? The first is inside socket, the second between sockets.

-Andi


--===============8849897231115486367==--

