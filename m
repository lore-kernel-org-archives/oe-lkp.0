Content-Type: multipart/mixed; boundary="===============7698846649655481857=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [sched/deadline] e0367b1267: WARNING:at_kernel/sched/sched.h:#assert_clock_updated
Date: Thu, 25 Jan 2018 13:24:59 +0100
Message-ID: <20180125122458.GB3420@rei>
In-Reply-To: <20180125112013.GA6110@localhost.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============7698846649655481857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> Hummm, wondering how LTP sched tests could trigger this, since a quick
> grep into ltp didn't show DEADLINE usage.

See kernel/syscalls/sched_setattr/sched_setattr01.c

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============7698846649655481857==--

