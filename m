Content-Type: multipart/mixed; boundary="===============8682658697571993767=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Wed, 08 Jun 2022 16:55:29 +0800
Message-ID: <bf9be90c-0cb9-6b41-77c7-14578ca3a8b0@intel.com>
In-Reply-To: <20220608073441.GE7547@1wt.eu>
List-Id: <oe-lkp.lists.linux.dev>

--===============8682658697571993767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 6/8/2022 3:34 PM, Willy Tarreau wrote:
> On Wed, Jun 08, 2022 at 10:26:12AM +0300, Moshe Kol wrote:
>> Hmm, How is the ICMP flood stress test related to TCP connections?
> =

> To me it's not directly related, unless the test pre-establishes many
> connections, or is affected in a way or another by a larger memory
> allocation of this part.
Agree.

>From the perf profile:

     48.67            +4.0       52.65 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.ip_finish_output2.raw_send_hdrinc.raw_sendmsg.sock_sendmsg.__sys_s=
endto
     44.05            +4.1       48.12 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backl=
og.__napi_poll.net_rx_action
     43.93            +4.1       48.00 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_sk=
b_one_core.process_backlog.__napi_poll
     43.72            +4.1       47.81 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.icmp_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_r=
eceive_skb_one_core.process_backlog
     17.10 =C2=B1  7%      +6.0       23.10 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.ping_rcv.icmp_rcv.ip_protocol_deliver_rcu.ip_local_deliver_fi=
nish.__netif_receive_skb_one_core
     17.05 =C2=B1  7%      +6.0       23.06 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.ping_lookup.ping_rcv.icmp_rcv.ip_protocol_deliver_rcu.ip_loca=
l_deliver_finish

ping_lookup took more time after the patch applied(raised from 17.05% to
23.06%). And still not direct connection with the patch.


Regards
Yin, Fengwei

> =

> Willy
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============8682658697571993767==--

