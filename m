Content-Type: multipart/mixed; boundary="===============3423261825647994046=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: 2d32f12eef: vm-scalability.median -3.5% regression
Date: Mon, 04 Mar 2019 11:05:15 -0800
Message-ID: <CAPcyv4jbJNMDPcFN61wx5Xt1cHD8a4qD9cpHT_d2KxpWvg7_NA@mail.gmail.com>
In-Reply-To: <20190304130512.GE25100@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3423261825647994046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 5:05 AM kernel test robot <rong.a.chen@intel.com> =
wrote:
>
> Greeting,
>
> FYI, we noticed a -3.5% regression of vm-scalability.median due to commit:
>
>
> commit: 2d32f12eefe7965cfab08a68fd793e7d96522462 ("[-mm only] mm/shuffle:=
 Default enable all shuffling")
> git://internal_merge_and_test_tree devel-catchup-201902220840

The randomization effectively ages the state of the free lists. Is
there any insight as to whether this result would reproduce on a
typical system that has been running long enough for the free lists to
be similarly scrambled?

--===============3423261825647994046==--

