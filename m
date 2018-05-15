Content-Type: multipart/mixed; boundary="===============3524311759345298509=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 15:27:34 -0700
Message-ID: <CA+55aFy6_fJkmuWDZC=d_WE+_oYHtXXCbb=R31jyC1qDKZ8HJw@mail.gmail.com>
In-Reply-To: <20180515214337.GA18021@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============3524311759345298509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 2:43 PM Alexey Dobriyan <adobriyan@gmail.com> wro=
te:

> It crashed into the middle of the padding.

No, the beginning of the padding. "int3" will push the return address on
the stack, so when it points to the second 'int3' instruction, it's because
the first one triggered.

                Linus

--===============3524311759345298509==--

