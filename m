Content-Type: multipart/mixed; boundary="===============5440179057970699840=="
MIME-Version: 1.0
From: Andreas Grünbacher <andreas.gruenbacher@gmail.com>
To: lkp@lists.01.org
Subject: Re: [selinux] 5d226df4ed: -10.1% unixbench.score
Date: Mon, 04 Jan 2016 23:41:36 +0100
Message-ID: <CAHpGcMJr7BGQyWrw3eEA8kCXwmFOUtPJRcg3dNs00gvK_RONTA@mail.gmail.com>
In-Reply-To: <87twn32v0p.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5440179057970699840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-12-28 2:59 GMT+01:00 kernel test robot <ying.huang@linux.intel.com>:
> FYI, we noticed the below changes on
>
> git://git.infradead.org/users/pcmoore/selinux stable-4.5
> commit 5d226df4edfa0eb1e689e7ac2741cf261ff7cbf1 ("selinux: Revalidate inv=
alid inode security labels")

I could reproduce the performance regression with:

  $ wget https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz
  $ tar xvfz UnixBench5.1.3.tgz
  $ cd UnixBench
  $ make
  $ ./Run pipe -c 1

Andreas

--===============5440179057970699840==--

