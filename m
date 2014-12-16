Content-Type: multipart/mixed; boundary="===============6804833048192158114=="
MIME-Version: 1.0
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 09:15:28 -0800
Message-ID: <20141216091528.17ee429d@ultegra>
In-Reply-To: <CAKohpokZCK3TAZx1mwo3zLxugkxg-h7MAXkTxA4LVWausufDYg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6804833048192158114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014 09:48:42 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 16 December 2014 at 02:54, Pan, Jacob jun
> <jacob.jun.pan@intel.com> wrote:
> =

> > Looks good to me. You can add my Reviewed-by to the above patch.
> =

> Thanks.
> =

> > I have tested this fix and confirm powerclamp is working properly
> > now.
> =

> Oh, nice.
> =

> > However, we also have a planned patch for consolidated idle loop.
> > With this patch it causes some erratic behavior in idle injection.
> > I can=E2=80=99t seem to synchronize/align idle time around jiffies with
> > this patch + fix.
> >
> > Any suggestions welcome.
> > https://lkml.org/lkml/2014/6/4/56
> =

> And all works fine without this patch ?
well, there are other things i need to improve. but this patch
definitely causes some new unwanted behavior.
> 2a16fc93d2c9 ("nohz: Avoid tick's double reprogramming in highres
> mode")
> =

> I really don't know what stuff out of the two patches I posted (The
> above one and the fix I posted yesterday), will possible make the
> synchronization bad ..
> =

But since your patch has real benefits and does not cause regression
with the current code, there is no reason to hold it back. I was just
hoping to get help on debugging this.

thanks,

Jacob
> --
> viresh

--===============6804833048192158114==--

