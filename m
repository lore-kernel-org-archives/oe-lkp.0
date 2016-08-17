Content-Type: multipart/mixed; boundary="===============7142377584173987264=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 16:02:45 +0800
Message-ID: <CADvbK_eErG-XPsDZJxjspqfC6dnF7AGSZaWNNzkZajw9SucMAA@mail.gmail.com>
In-Reply-To: <375f06dd-8439-bba3-8b45-781e1e48dc9c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7142377584173987264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> you mean only this two line:
>>> +       unsigned long prsctp_param;
>>> +       int sent_count;ca;
>>
>> caused the performance issue ?
>
> Right.
OK, can you remove this line from your patch
+       int sent_count;

then test again, thanks.

--===============7142377584173987264==--

