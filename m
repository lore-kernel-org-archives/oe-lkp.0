Content-Type: multipart/mixed; boundary="===============2513807375270216594=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 09:48:42 +0530
Message-ID: <CAKohpokZCK3TAZx1mwo3zLxugkxg-h7MAXkTxA4LVWausufDYg@mail.gmail.com>
In-Reply-To: <DD415AA12F8FF042BF4EA69DF123C1478AF76532@ORSMSX106.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2513807375270216594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16 December 2014 at 02:54, Pan, Jacob jun <jacob.jun.pan@intel.com> wr=
ote:

> Looks good to me. You can add my Reviewed-by to the above patch.

Thanks.

> I have tested this fix and confirm powerclamp is working properly now.

Oh, nice.

> However, we also have a planned patch for consolidated idle loop. With th=
is patch it causes some erratic behavior in idle injection.
> I can=E2=80=99t seem to synchronize/align idle time around jiffies with t=
his patch + fix.
>
> Any suggestions welcome.
> https://lkml.org/lkml/2014/6/4/56

And all works fine without this patch ?
2a16fc93d2c9 ("nohz: Avoid tick's double reprogramming in highres mode")

I really don't know what stuff out of the two patches I posted (The above o=
ne
and the fix I posted yesterday), will possible make the synchronization bad=
 ..

--
viresh

--===============2513807375270216594==--

