Content-Type: multipart/mixed; boundary="===============5741023636024692421=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [xattr] 6e21a50861: ltp.setxattr02.fail
Date: Mon, 06 Sep 2021 10:12:12 +0200
Message-ID: <YTXNXOKbrl17Lx+s@yuki>
In-Reply-To: <20210905134541.GD15026@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5741023636024692421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> commit: 6e21a5086100cebefd21a3058a9e1160668f84fa ("xattr: Allow user.* xa=
ttr on symlink and special files")
> https://github.com/rhvgoyal/linux user-xattr-symlink-v3

The test that fails is a test that asserts that you can't add extended
attributes to a block or char device and it's obvious why this fails.

Feel free to ignore this failure, we will have to fix the tests once/if
this patchset gets accepted upstream.

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============5741023636024692421==--

