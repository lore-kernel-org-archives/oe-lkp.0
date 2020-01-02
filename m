Content-Type: multipart/mixed; boundary="===============7933348923146869334=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [iomap] 3af5053534: WARNING:at_fs/iomap/buffered-io.c:#iomap_readpages
Date: Thu, 02 Jan 2020 14:08:46 +0100
Message-ID: <20200102130846.GF32710@rei.lan>
In-Reply-To: <20191219134725.GE2760@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7933348923146869334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
Looks like FALLOC_FL_ZERO_RANGE fails, at least that's where the test
reports wrong bytes in the file.

The source code of the test:

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sysc=
alls/fallocate/fallocate04.c#L157


-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============7933348923146869334==--

