Content-Type: multipart/mixed; boundary="===============3756221534911933172=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 9bd0e337c6: will-it-scale.per_process_ops -4.8% regression
Date: Thu, 03 Dec 2020 10:50:03 -0700
Message-ID: <8124ce0d-c934-0771-5e34-cf5ea030fc08@kernel.dk>
In-Reply-To: <CAHk-=wif1iGLiqcsx1YdLS4tN01JuH-MV_oem0duHqskhDTY9A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3756221534911933172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/20 10:47 AM, Linus Torvalds wrote:
> On Wed, Dec 2, 2020 at 10:31 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
>>
>> FYI, we noticed a -4.8% regression of will-it-scale.per_process_ops due =
to commit:
> =

> Ok, I guess that's bigger than expected, but the profile data does
> show how bad the indirect branches are.

It's also in the same range (3-6%) as the microbenchmarks I ran and posted.
So at least there's correlation there too.

-- =

Jens Axboe

--===============3756221534911933172==--

