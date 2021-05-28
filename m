Content-Type: multipart/mixed; boundary="===============3260333852549216425=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 27 May 2021 17:58:53 -0700
Message-ID: <7bda8e6a-2179-b431-973b-d074cd8d93db@linux.intel.com>
In-Reply-To: <20210527210524.GE4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3260333852549216425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Only those cloud provides making heavy use of the aforementioned "poorly
> designed" hardware, correct?

If any such hardware is deployed in non homeopathic quantities, we =

probably need to support it out of the box. So far I'm not seeing any =

evidence that it does not.

That would argue for including the patch in the patch series.

Especially since stress-ng is somewhat popular for system testing.



--===============3260333852549216425==--

