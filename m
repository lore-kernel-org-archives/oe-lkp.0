Content-Type: multipart/mixed; boundary="===============0831542187933690193=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 16:48:32 +0800
Message-ID: <20160817084832.GA5342@aaronlu.sh.intel.com>
In-Reply-To: <CADvbK_eErG-XPsDZJxjspqfC6dnF7AGSZaWNNzkZajw9SucMAA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0831542187933690193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 04:02:45PM +0800, Xin Long wrote:
> >> you mean only this two line:
> >>> +       unsigned long prsctp_param;
> >>> +       int sent_count;ca;
> >>
> >> caused the performance issue ?
> >
> > Right.
> OK, can you remove this line from your patch
> +       int sent_count;
> =

> then test again, thanks.

It doesn't change on my desktop Sandybridge.

$ cat 4.7.0-rc6-01199-g116558d316e8/0/netperf.json
{
  "netperf.Throughput_Mbps": [
   748.2056249999998
  ]
}

Where commit 116558d316e8 is based on top of the last test commit
98dd2532b14e with the sent_count removed.

Thanks,
Aaron

--===============0831542187933690193==--

