Content-Type: multipart/mixed; boundary="===============3502827200347327178=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locking/percpu] 1916a96ef1: INFO: task systemd:1 blocked for more than 300 seconds.
Date: Tue, 19 Jul 2016 15:31:47 +0200
Message-ID: <20160719133146.GA6410@redhat.com>
In-Reply-To: <20160719021607.GB13203@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3502827200347327178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/19, kernel test robot wrote:
>
> https://github.com/0day-ci/linux Peter-Zijlstra/locking-percpu-rwsem-Opti=
mize-readers-and-reduce-global-impact/20160715-142422
> commit 1916a96ef19d77b4ff2f83711bb4233dc4d81dbf ("locking/percpu-rwsem: I=
ntroduce bias knob")

Yes, gp_state =3D=3D !GP_IDLE in sabotage was not right, this will be fixed.

Oleg.


--===============3502827200347327178==--

