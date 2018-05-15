Content-Type: multipart/mixed; boundary="===============2925646140264841387=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Wed, 16 May 2018 00:07:57 +0300
Message-ID: <20180515210757.GA12225@avx2>
In-Reply-To: <20180515080033.GA7714@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2925646140264841387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 04:00:33PM +0800, kernel test robot wrote:

> [   11.182501] Code: 00 00 00 eb e6 cc cc cc cc cc cc cc cc cc cc cc cc c=
c fa 8d b6 00 00 00 00 e8 5d e8 8f ff 8b 44 24 34 83 e0 03 83 f8 03 72 28 c=
c <cc> cc cc cc cc cc cc fa 8d b6 00 00 00 00 e8 3d e8 8f ff 89 e0 =

> [   11.184326] EIP: ret_from_intr+0xd/0x14 SS:ESP: 0068:8603bfb4

INT3 slipped through M586 =3D> X86_ALIGNMENT_16 :-\

--===============2925646140264841387==--

