Content-Type: multipart/mixed; boundary="===============0297485064777589379=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Tue, 17 Oct 2017 15:06:33 -0700
Message-ID: <CALCETrWc1EMGihfKJMqZarbAhrOOjdhgsmpNtPHOrXndTyw19w@mail.gmail.com>
In-Reply-To: <20171017080037.fmgovp53nbvuukzh@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0297485064777589379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 1:00 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Tue, Oct 17, 2017 at 06:57:43AM +0200, Markus Trippelsdorf wrote:
>> On 2017.10.16 at 18:06 -0700, Andy Lutomirski wrote:
>> > On Mon, Oct 16, 2017 at 3:15 AM, Borislav Petkov <bp@alien8.de> wrot=
e:
>> > > On Mon, Oct 16, 2017 at 10:39:17AM +0800, kernel test robot wrote:
>> > >>
>> > >> Greeting,
>> > >>
>> > >> FYI, we noticed a -61.0% regression of will-it-scale.per_process_op=
s due to commit:
>>
>> I think you are reading this wrong:
>> -61.0% regression means 61.0% improvement.
>
> Well, it has this:
>
> 5b8809deb4b0a77f  c4c3c3c2d00826c88b5c02c20e
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>     448554             -61%     174892        will-it-scale.per_process_o=
ps
>
> Xiaolong, can you first explain what those numbers mean? And how do you
> compute those 61%?

I still don't understand what the numbers mean, but this is a PCID
machine (and it's passed through correctly), so the patch will
certainly cause a regression in a benchmark that involves a lot of
brief idle periods.  This kind of issue is why I like having the
debugfs knob there, at least until the dust settles.

>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.

--===============0297485064777589379==--

