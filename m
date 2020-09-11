Content-Type: multipart/mixed; boundary="===============8937894676747858509=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [PATCH] syscalls/ptrace10: Add new regression test
Date: Fri, 11 Sep 2020 17:36:59 +0200
Message-ID: <20200911153659.GA7234@yuki.lan>
In-Reply-To: <6d9b6e46-8337-9614-8fd7-b6ada8fcbe13@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8937894676747858509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> the code looks good, though it might make sense to simply integrate the
> check into ptrace08. Just 6 extra lines in the existing test should
> achieve the same coverage.

I would like to avoid triggering the "your system may be vunerable"
messages on fixed kernel, hence the separate test.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============8937894676747858509==--

