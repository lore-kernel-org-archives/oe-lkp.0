Content-Type: multipart/mixed; boundary="===============2049475993297480267=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [btrfs_mount] general protection fault: 0000 [#1] SMP
Date: Wed, 29 Nov 2017 18:44:43 -0800
Message-ID: <CA+55aFzOgPOV+UZu6jCJMrbxOSBvn1UdxC5phAwC7n8n4asR5w@mail.gmail.com>
In-Reply-To: <3A84FF7B-0390-41EC-862D-5F83C2A656FA@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2049475993297480267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2017 at 6:38 PM, Nick Terrell <terrelln@fb.com> wrote:
>
> The stack trace looks like the bug fixed by
>
> Qu Wenruo:
>     btrfs: Fix wild memory access in compression level parser [1]
>
> That fix looks to be included in the pull request for 4.15-rc2 [2].

Which got merged earlier today. So maybe instead of a bisection, just
test the current git tree?

               Linus

--===============2049475993297480267==--

