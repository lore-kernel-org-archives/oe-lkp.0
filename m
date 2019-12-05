Content-Type: multipart/mixed; boundary="===============0119095057358370144=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [f*xattr] ab91fe640f: ltp.open13.fail
Date: Thu, 05 Dec 2019 13:36:34 +0100
Message-ID: <20191205123633.GC5693@rei.lan>
In-Reply-To: <20191205112439.GE32275@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0119095057358370144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> commit: ab91fe640fca6de988a888b2de89d58014d120d4 ("f*xattr: allow O_PATH =
descriptors")
> https://git.kernel.org/cgit/linux/kernel/git/mszeredi/vfs.git for-viro

Looks like fgetxattr() on fd that has been opened with O_PATH returns
wrong errno after this patch, which I guess is OK because that seems to
be the point of this patch.

We will fix the test if/once this patch gets upstreamed.

Also btw man 2 open needs changes in the O_PATH paragraph after this as
well.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============0119095057358370144==--

