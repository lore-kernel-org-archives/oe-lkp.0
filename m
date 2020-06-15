Content-Type: multipart/mixed; boundary="===============7779743570799897762=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] 303cc571d1: ltp.setns01.fail
Date: Mon, 15 Jun 2020 11:18:50 +0200
Message-ID: <20200615091850.GA3373@yuki.lan>
In-Reply-To: <20200615085836.GR12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7779743570799897762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22: e=
rrno=3DEBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x20000)
> setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22: e=
rrno=3DEBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x40000000)
> setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22: e=
rrno=3DEBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x20000000)
> setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22: e=
rrno=3DEBADF(9): Bad file descriptor
> setns01     0  TINFO  :  setns(12, 0x4000000)
> setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22: e=
rrno=3DEBADF(9): Bad file descriptor

The messages here are a bit cryptic, I will fix that later on, but what
it means here is that the errno has changed from EINVAL to EBADF in a
case we pass file descriptor to a regular file to setns().

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============7779743570799897762==--

