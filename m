Content-Type: multipart/mixed; boundary="===============7613686209379414695=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Wed, 16 May 2018 01:50:28 +0300
Message-ID: <20180515225028.GA21902@avx2>
In-Reply-To: <CA+55aFy6_fJkmuWDZC=d_WE+_oYHtXXCbb=R31jyC1qDKZ8HJw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7613686209379414695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 03:27:34PM -0700, Linus Torvalds wrote:
> On Tue, May 15, 2018 at 2:43 PM Alexey Dobriyan <adobriyan@gmail.com> w=
rote:
> =

> > It crashed into the middle of the padding.
> =

> No, the beginning of the padding. "int3" will push the return address on
> the stack, so when it points to the second 'int3' instruction, it's becau=
se
> the first one triggered.

Sending i386 patches should not be done that late...

I checked 32-bit asm as well.

--===============7613686209379414695==--

