Content-Type: multipart/mixed; boundary="===============8381857855739082753=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [rhashtable] WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:301 __debug_object_init()
Date: Tue, 14 Jul 2015 10:50:26 +0200
Message-ID: <55A4CD52.5060104@iogearbox.net>
In-Reply-To: <20150714052136.GA20251@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8381857855739082753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/14/2015 07:21 AM, Fengguang Wu wrote:
> Sorry please ignore -- this no longer happen in linux-next, so should be =
fine.

Seen this before, this fixed it back then:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/lib/=
test_rhashtable.c?id=3Db7f5e5c7f8cedf6b69c9702d448cdf78ffc45c7b

--===============8381857855739082753==--

