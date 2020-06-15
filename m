Content-Type: multipart/mixed; boundary="===============0495241591571333229=="
MIME-Version: 1.0
From: Jan Stancek <jstancek@redhat.com>
To: lkp@lists.01.org
Subject: Re: [LTP] 303cc571d1: ltp.setns01.fail
Date: Mon, 15 Jun 2020 10:03:01 -0400
Message-ID: <1101600340.15989438.1592229781375.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200615091850.GA3373@yuki.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============0495241591571333229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



----- Original Message -----
> Hi!
> > setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22:
> > errno=3DEBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x20000)
> > setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22:
> > errno=3DEBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x40000000)
> > setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22:
> > errno=3DEBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x20000000)
> > setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22:
> > errno=3DEBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x4000000)
> > setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=3D22:
> > errno=3DEBADF(9): Bad file descriptor
> =

> The messages here are a bit cryptic, I will fix that later on, but what
> it means here is that the errno has changed from EINVAL to EBADF in a
> case we pass file descriptor to a regular file to setns().

I posted a series that accepts both errnos about week ago:
  https://lists.linux.it/pipermail/ltp/2020-June/017467.html

--===============0495241591571333229==--

