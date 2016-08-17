Content-Type: multipart/mixed; boundary="===============2128688049672507961=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 15:35:25 +0800
Message-ID: <CADvbK_dKLU07+tW4f2XpCWgQME8mnjg8EObcfmH4i8s8Aume4w@mail.gmail.com>
In-Reply-To: <20160817063719.GA5463@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2128688049672507961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>  include/net/sctp/structs.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/net/sctp/structs.h b/include/net/sctp/structs.h
> index d8e464aacb20..932f2780d3a4 100644
> --- a/include/net/sctp/structs.h
> +++ b/include/net/sctp/structs.h
> @@ -602,6 +602,9 @@ struct sctp_chunk {
>         /* This needs to be recoverable for SCTP_SEND_FAILED events. */
>         struct sctp_sndrcvinfo sinfo;
>
> +       unsigned long prsctp_param;
> +       int sent_count;
> +
>         /* Which association does this belong to?  */
>         struct sctp_association *asoc;
>
> --
> 2.5.5
>
> Then the performance dropped to the same as the bisected commit
> a6c2f792873a:
> $ cat 4.7.0-rc6-01198-g98dd2532b14e/0/netperf.json
> {
>   "netperf.Throughput_Mbps": [
>    754.494375
>   ]
> }
>
> I think this agrees with the perf data in that the newly added function
> doesn't show up in the perf-profile but still, the performance drops.
> So the only possible reason is the newly added fields to the sctp_chunk
> structure.
>
> Is this expected?
interesting , you didn't include the modification of the functions
parts, right ?
you mean only this two line:
> +       unsigned long prsctp_param;
> +       int sent_count;ca;

caused the performance issue ?

--===============2128688049672507961==--

