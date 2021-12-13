Content-Type: multipart/mixed; boundary="===============9042064348535504629=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Mon, 13 Dec 2021 10:37:49 -0800
Message-ID: <CAHk-=wjsTk2jym66RYkK9kuq8zOXTd2bWPiOq43-iCF6Qy-xQQ@mail.gmail.com>
In-Reply-To: <20211213083154.GA20853@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9042064348535504629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 12:34 AM Carel Si <beibei.si@intel.com> wrote:
>
> We tested your patch, the performance regression has recovered from -5.7%=
 to
> -0.4%, thanks.

Thanks for testing.

That probably means that the cost was literally mostly the overhead of
function call/exit, and now that it's simple enough for gcc to inline,
it went back to being equivalent to the old leaf-function overhead.

I also suspect that it means that the benchmark is likely not great (I
didn't look at details - I assume it's literally a microbenchmark just
doing a very tight poll() loop in multiple threads), but hey, that's
not all that uncommon.

And I do think the resulting code after this patch is better (in
organization, in comments, and obviously in code generation), so maybe
the benchmark isn't great, maybe this case doesn't matter all that
much in reality, but the end result is better for it.

So I'll just apply the patch. Thanks for the report and the testing
(including testing the one-liner that didn't help).

           Linus
--===============9042064348535504629==--

