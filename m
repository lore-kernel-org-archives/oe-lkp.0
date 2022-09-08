Content-Type: multipart/mixed; boundary="===============2074550624659633115=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec -26.5% regression
Date: Thu, 08 Sep 2022 08:14:20 -0400
Message-ID: <CAHk-=wi0FPu6E9sViTxaSmqxM=go+M+DuJpfdCW9f-1adpXUpQ@mail.gmail.com>
In-Reply-To: <0214b84c-71fe-2133-b69d-1e39a19cc468@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2074550624659633115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2022 at 4:56 AM Yin, Fengwei <fengwei.yin@intel.com> wrote:
>
> The test result looks good (only test with 72 process doesn't restore to =
same level as
> original result).

Thank you. I've committed that fix (with a slight syntax change and a
full commit message).

On an entirely different note, I'll just have to admit to my
ignorance, and didn't know how you prefer your name in the "tested-by"
line. For all I know, you might prefer the family name first, with or
without a comma. But I ended up writing it Westernized as "Fengwei
Yin", which seems to be the most common form in other kernel commit
messages, and in some comments.

Maybe you don't care, or maybe you care deeply. If you do, just let me
know for future reference and I'll try to remember.

(Maybe you don't care deeply, but I remember the mess international
"spelling" of Finnish names used to be when 7-bit US-ASCII was the
norm, so I _try_ to make sure that we at least attempt to get names of
people right in the kernel.)

I only later noticed that you actually signed your email "Yin,
Fengwei", which is what makes me think I screwed up and is the reason
for this note.

              Linus
--===============2074550624659633115==--

