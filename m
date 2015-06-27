Content-Type: multipart/mixed; boundary="===============3451704786073794135=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/entry/64] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:3561 check_flags()
Date: Sat, 27 Jun 2015 08:48:57 -0700
Message-ID: <CALCETrV3n19AFXyi5SO7wRVELw56TU1CTjeWTsUgVq6dD5Ws-Q@mail.gmail.com>
In-Reply-To: <20150627062913.GA23578@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3451704786073794135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2015 at 11:29 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
> Ah it has been reported, sorry for the duplicated report!

No problem.  It was a good catch -- this bug seems to be quite
dependent on kernel config.

--Andy

--===============3451704786073794135==--

