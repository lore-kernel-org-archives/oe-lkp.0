Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C03C04
	for <oe-lkp@lists.linux.dev>; Mon, 10 Apr 2023 15:55:14 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ACvwjM002759;
	Mon, 10 Apr 2023 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=dgBDaCSb0Ps7el3ch7PoziSGN/CmfLpfS10Of6XMam4=;
 b=lCpo95TLdOC+le+7P/RoY3gmwDBTXhxdx3hPVnxbvPzUNLFD+FpyaA5ZA8Xho6o4pULj
 geJVStWlG3VTRLh9wdXY7a256NtZeJkFNfObNh/pUJ7v9V8LFKngwiXLVwdTHAcBZX/c
 jQU4T9/emSV8+TtVDW2GIPJXmPf/lro4/8voPO5Z8q6wxrwg7Q95fsw1AlT5bVESMNjz
 sS5r9Ula/TiDkaY/GB5ZuZWiqgsx4WyX4Inu122YMBTJcT+gmIEKrx+WAEoEMY4NBaVP
 l11FgmFJHPTmyCFtM9qKiiOH+G4b90D2uliu3FSlMjh8EuF2+t60D5zrmhfDOTkaSA0W zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0eq3616-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Apr 2023 15:54:53 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33AFrvc5034252;
	Mon, 10 Apr 2023 15:54:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3puwc2cwb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Apr 2023 15:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmC1c54DWEvGh90xVUspGwJe4Qtw8QH6Ei/KPyYcOBxvLMUV5c3muZ4Yv0kEUbUjfSCmbD6nvWwnecD6H6GAqdOUa/kZcg5cfrsNz7RCv9EWp+z6v7YF0bz15dAdDkl0GyTDt5G72ehCv+m7lELz4H8ctX2S1SYXXbGZoHc/afJcQiRByHljCgpiQJvUdy+AOUfs0+tMMMWh7csIyf8FRc2T485EisryqWfFr2mFs251Y80BfA3W7cAyjmOqRZqAAD2fPu6xOxfc9wKBVqkSQwHBy/yX0xLOuE3uLYbRvbtaAXNIRJAtFN3xfSM/xpEFHboefdYFXv3ULBVQDb6Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgBDaCSb0Ps7el3ch7PoziSGN/CmfLpfS10Of6XMam4=;
 b=fYmnU4hvnsDRDr/BiW0Gz/+v7uoah8xsvnj43V8MCsa8D8eZA19jO//mBAh+s0decDu6GwnS77eBffCbN1XGGqP0sXW4m9bmqmS+38i1ZnB3H9b7mMcOasx+8FTXLuXfuwSlbhQ9Cj+cqh4Sym7Rae7GUZp+VqivP0DHlxOS5gspsiOAyFuSiEmy2MFOMCrmEUiAjuOaqwUzHhmuEVPFqOut2oml+PP24R05ZM/DtaPQppvRqjl1tq8AjjyIvdH2abk4ZCo2DIRpo6hb1X1EK3lUnqkNsy7X9ZkBhEBy8VuEZCVmTHeszPSQA4/dfHNhdTw8gEl4b5Uk0OiXo6TVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgBDaCSb0Ps7el3ch7PoziSGN/CmfLpfS10Of6XMam4=;
 b=pV/pD5Th1PpeBg0/FTf1fXdvrcMIpiqhO78cGSub17j2iDA/jFJxBbQiGw33ZuExiOUwwZgYqu2PGTmGzZ7CN2lwDTjw8X7m6ArdAEolkFoixiR/Mr/GM2CYlKE4/D6PAwoneTvEITF3tcFVF25lfouUf9f62Xun9N9olMcCW84=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Mon, 10 Apr
 2023 15:54:49 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::ecbd:fc46:2528:36db%6]) with mapi id 15.20.6277.035; Mon, 10 Apr 2023
 15:54:49 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel test robot <oliver.sang@intel.com>,
        "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>,
        kernel test robot <lkp@intel.com>
CC: Jeff Layton <jlayton@kernel.org>,
        Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [jlayton:tmpfs] [shmem]  1dbf9cad31:
 WARNING:inconsistent_lock_state
Thread-Topic: [jlayton:tmpfs] [shmem]  1dbf9cad31:
 WARNING:inconsistent_lock_state
Thread-Index: AQHZa1enjidOQoeXwE+EDHsK8Q+KFq8kstIA
Date: Mon, 10 Apr 2023 15:54:48 +0000
Message-ID: <694D09FC-B42F-4A9B-A5BE-8D08A5706E2C@oracle.com>
References: <202304101018.4e0ba3fd-oliver.sang@intel.com>
In-Reply-To: <202304101018.4e0ba3fd-oliver.sang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SA2PR10MB4716:EE_
x-ms-office365-filtering-correlation-id: c34e579c-b242-416f-3f83-08db39dbea0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 deDruNJvKpnh+kLn54RM0ZmPRYWhkXDfRRST7rE+FecaaaxZvzYDqSqRz+q7wE4jnOseWgvWnFbXnwnMv2Z8LWT6Sw7cQHHwFfHgLtIqUneT/gluuW1vSU6j5hZNm8M1bsg22yvLBL9FoBmI7fyg96D0ZHtm3VaIW8RqnADPDcg5MPjrneWHQUscKCEW+Jb/7ygvb20U84snUuBHkUuxEQZyBBZyeE436RbgSeSi8m/be0HF5R0VZPVgGg6jpWXAJgSDGdJSi86zUtqJSwCyqTjoAQltzItYhYCarrTgBqS/lbkvFuOnEeL/NbxvTwdcntHb6kay78u4MUT2wVz4YLbaZJlmWV7BH/bL8RkytDdhopJthq9tgukLHYTBB5SBS+phsYobvuGFXtfoZgHBF+9d5eo9m2Z+2LfKqj8OShGPHhjsRgoisSl3KWMVRPNx71e0jRHJqSATBcRGJ4bgJFTtor5U6kzeaq9OeeJybxzTSlVuRE0yZZUFWah3WGCN9F34prxY4y+sFImWcReHxfRYgmvCUl+116YeqGfKGEgCv+/0KbMsbR/O7F5VQHxxMq8kI+6mHf9PUZPe7z2/QMDvIspRdGnnSnwQILc6NhL4qYFIzK8cJyuog11R/Rb9GLj5lVo3ChdyLK1284cB9CjUlRQd+lwhzoxqI85K3f0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(54906003)(110136005)(316002)(478600001)(83380400001)(2616005)(6512007)(186003)(26005)(6506007)(33656002)(36756003)(53546011)(38100700002)(122000001)(86362001)(38070700005)(71200400001)(6486002)(966005)(8936002)(41300700001)(76116006)(91956017)(64756008)(2906002)(8676002)(66446008)(4326008)(66476007)(30864003)(66946007)(66556008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vcNMW6C2mU8Z9lLvg0BLWjgkA9hnTiq5dqGHo89gv5eocShwWLYcLD8Yftr0?=
 =?us-ascii?Q?a65RPvp8NtJegWuihSr323/QJOoxUu06R6vZ8LJiIYgvFu2j20XzyjSzVqhX?=
 =?us-ascii?Q?cYXJxqPUrihHZphEQ2/nB9e1aKULixDFAJL2l171Q5D6qbp7vhPkIhtdFAKy?=
 =?us-ascii?Q?ioT1/Ujhn7ixfnsv/Hc3BA6PDRtetgE8Rg7AOnPCtHQHzPD1sM0qqiOYNbdO?=
 =?us-ascii?Q?oes1i0DVbFpOz5+PaCkV/J2+R8c88Iw5dVxqjqnuQtqVXk5Qjq1I8wCIXJut?=
 =?us-ascii?Q?gh/mOnU0yjBLU9FIuvGsO0FgGDc4Vf7giLGJPuCmie0hYUYDLU5i5Wz840XY?=
 =?us-ascii?Q?mGJmWnQgvIIp+AjlHSEqjbd+WRxlmDrTPS6AODmJElmJWuJNxIpiAk4jEwkM?=
 =?us-ascii?Q?zf5R9284lO/+U1EgxfxUUOOA+tHcxYnDMdf+cXAG5uhzDlA3kST0o0sXXbfQ?=
 =?us-ascii?Q?OHMpY0mMhy1LJ2wxEtWsMW7gQR/GTqktWk84uENiO55K1uD85aTmphL+uHHn?=
 =?us-ascii?Q?ZgOAH6BLv6r85zkGoeGZHsNtfsFf4x4K8iBK5TzZ58WuSOrqfK2B+Lyqn2S/?=
 =?us-ascii?Q?Mq81zN5cMHWHUzQnbYROdS/1NDPE/zMzvjvrZAHR8EjkYyJdGVlcOr6tcYbv?=
 =?us-ascii?Q?kV/Z2JMShniwWfcIgUQhc/CgDjC//7EBAofYlAIPZA1uuQH4hJMBY3SXoJUC?=
 =?us-ascii?Q?lXLmNQhTZ5t8GkKUugE///R9HDC9x/2/bDFVlof7BQpczyW0tS5jMa7BkGZP?=
 =?us-ascii?Q?kaJDBujczzMyH0q+1CNVYYoEo1Tj05izEtQsIhV9AgQM9riiUFr+gKG2jUHx?=
 =?us-ascii?Q?zodsWWkwTVk3OhQU+ZGmzzHZ6oW2wlgkb+Wtpa3etCgnNnG/KgZpwbeOLSev?=
 =?us-ascii?Q?Huj9+7xTUVq+6d0LQuMGEqWt+Gfx2EUDGCDl7A72McFQ5gonPc8doybxQtda?=
 =?us-ascii?Q?avU/7FH+TkjrtvGwh7JAoYiSyaGnwbwP5BPiOeXGnjfR3ZWj7Fjyh+3sAhXF?=
 =?us-ascii?Q?N6iBnx9bAl1ZQosLxwseXxXvceywd95ez6OCYg4Z0c0qCU/V6Rly4gUeQTNs?=
 =?us-ascii?Q?rqIJx9TcGq7VXUIMIMS1NoKz7ZtOolihG2qJX3+LcgapDx30zk1oS0qYnWSY?=
 =?us-ascii?Q?dUHDekaFL6ICvPTDZyStbpy6D+5uaoMiw9Wijr75QX+bt79B8MeY4CahQZH8?=
 =?us-ascii?Q?ZOp8nzssE3SkuICU9jHaX+tjnfKqoIz1IfbDb4QXSwQQSksxXlsndiQZakoF?=
 =?us-ascii?Q?jzxD6Pw1J0oAxBJyDQULpjw9xSLVrL9RDovDYbTMqnh0VZ9bje5zP4oeuDKq?=
 =?us-ascii?Q?xStPjd6jVb+L14i56aMV4Aop1h3xt8lZorQ7bYXXGZ8HySzTk+KW7egRWPWr?=
 =?us-ascii?Q?7kvyfek9uVlWrey2v7Tii75DWLTLxQoNf0S0hcTE3ASbVQ6PXWE3YHDF9WTk?=
 =?us-ascii?Q?BUsYRQ+SxudG/J7i/atn3PHPhvxt6vSku3iup/Zs2pMDIDmrDYw8TunK5iAf?=
 =?us-ascii?Q?an8MEc3Y/B7nBtN2j3Lc0h8n4cZYecG/X0bh3hwsxYXIKxP449xFcCMkdcpw?=
 =?us-ascii?Q?Sq5zWlzWM8Io4mzKzuAssVNYNfJOQnE7vioajZMW5Qyons8K85qVlrgYmTnn?=
 =?us-ascii?Q?9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1923CAE97184EB4AA502A89A592B4ABA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8fGbgwb06ALPN4oFzW3wCVECZYuXy8q1rJ8sjxsCP/u8fAwgqQmzZkmwFPWWz8DwQavVWqzKuIqmebQb8heh//Z07CNRGSSreAFda237oe/GnEpinig2kywjHL1ULB242ZZnP88gQqEHq+9cEAA6UYF4IAl1GDF0kVMpFffyz7OhnyBacRIVSOph0AB2CF92nJFReQ3z0scnG3Rgti5WYKL3UFdlKGgLKbx5nncM7MatvGfzW5LWwiD7x8FLigvgy0ryNnz7HaazMa6rwZEK2Ieo4w40mG5K6bWRt1LRvtA3spXY/8Hjcw2qkkan4gQmXTXHSEEMJB4TYAx6BPBbLolVDhbmuMpzWvS4CYKpsJTIdrGaKVrINwaGy8aHYc+m/e8xh4KDPlRQCBl/jCscxIGZ8tcuCdLzVLFsrBErmzpBvyJh9ZKN0BbtXAuooMLiVcQfWMeuRWoT79Wv8jc9nSqCaagqOUyOKrHbjaEphCh4lfuXB/Ru6DpaVlql0Q426SdA+orp3ysu4Tfw/G3DfJitxkVFEriWmn/aJQqebzxCBy4t8EavqVeBSQiw9NAX/cchX9FE2EpkNYXInNKQxQLtnwRWxGhVyoBbuwH59man322JObH01fYnK1hBT27H0KpbTh4oiHpVxwWOIzZD24xpI0+YHtV9mZ2BvqvhqymU1qy+RJX8yiC13Jx6uKwyFXYsyK5pPJvMhpcUjojutpzR4vWJR8qVt9ozcEjxhOczhyC6qLAtVmUHL5B0ZK9SISvndB2tthEbvvtpBO4dAyyxyCKJdf7Pb92Tk93UT1Rh31Sc6IrQGCYH1RcF08hXvVwbGPQetnN6Q/C3iu2NRg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34e579c-b242-416f-3f83-08db39dbea0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 15:54:48.9699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DpRetu1vcLzVwHuL+AAMS8oumzEd/OS7V7HrbtCEBc5laaR7FJ//+Xd03lmgyvEz2Ztx/NbQbSSvgp/QYdnP4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304100136
X-Proofpoint-GUID: 2PQmKjdjo3dp695yrs8ya2EuL-yYQFRw
X-Proofpoint-ORIG-GUID: 2PQmKjdjo3dp695yrs8ya2EuL-yYQFRw



> On Apr 9, 2023, at 10:53 PM, kernel test robot <oliver.sang@intel.com> wr=
ote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed "WARNING:inconsistent_lock_state" on:
>=20
> commit: 1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61 ("shmem: stable director=
y cookies")
> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git tmpfs
>=20
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-60acb023-1_20230329
> with following parameters:
>=20
> group: sgx
>=20
> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>=20
>=20
> compiler: gcc-11
> test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz=
 (Coffee Lake) with 32G memory
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202304101018.4e0ba3fd-oliver.sang@=
intel.com
>=20
>=20
> [   38.672635][    C0] WARNING: inconsistent lock state
> [   38.677619][    C0] 6.3.0-rc5-00001-g1dbf9cad3182 #1 Not tainted
> [   38.683656][    C0] --------------------------------
> [   38.688647][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usag=
e.
> [   38.695368][    C0] systemd/1 [HC0[0]:SC1[1]:HE0:SE0] takes:
> [ 38.701058][ C0] ffff888877549bd8 (&xa->xa_lock#3){+.?.}-{2:2}, at: xa_d=
estroy (lib/xarray.c:2214)=20
> [   38.709532][    C0] {SOFTIRQ-ON-W} state was registered at:
> [ 38.715131][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
> [ 38.719875][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locki=
ng/lockdep.c:5671 kernel/locking/lockdep.c:5634)=20
> [ 38.724339][ C0] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 ke=
rnel/locking/spinlock.c:154)=20
> [ 38.728812][ C0] shmem_doff_add (include/linux/xarray.h:965 mm/shmem.c:2=
943)=20
> [ 38.733376][ C0] shmem_mknod (mm/shmem.c:3014)=20
> [ 38.737676][ C0] vfs_mknod (fs/namei.c:3916)=20
> [ 38.741885][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228 drivers=
/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408)=20
> [ 38.746876][ C0] devtmpfsd (devtmpfs.c:?)=20
> [ 38.750913][ C0] kthread (kernel/kthread.c:376)=20
> [ 38.754950][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314)=20
> [   38.759333][    C0] irq event stamp: 3472493
> [ 38.763625][ C0] hardirqs last enabled at (3472492): kasan_quarantine_pu=
t (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/as=
m/irqflags.h:77 (discriminator 1) arch/x86/include/asm/irqflags.h:135 (disc=
riminator 1) mm/kasan/quarantine.c:242 (discriminator 1))=20
> [ 38.773551][ C0] hardirqs last disabled at (3472493): _raw_spin_lock_irq=
save (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162)=20
> [ 38.783580][ C0] softirqs last enabled at (3471804): __do_softirq (arch/=
x86/include/asm/preempt.h:27 kernel/softirq.c:415 kernel/softirq.c:600)=20
> [ 38.792916][ C0] softirqs last disabled at (3472447): __irq_exit_rcu (ke=
rnel/softirq.c:445 kernel/softirq.c:650)=20
> [   38.802453][    C0]
> [   38.802453][    C0] other info that might help us debug this:
> [   38.810393][    C0]  Possible unsafe locking scenario:
> [   38.810393][    C0]
> [   38.817760][    C0]        CPU0
> [   38.820931][    C0]        ----
> [   38.824096][    C0]   lock(&xa->xa_lock#3);
> [   38.828306][    C0]   <Interrupt>
> [   38.831644][    C0]     lock(&xa->xa_lock#3);
> [   38.836027][    C0]
> [   38.836027][    C0]  *** DEADLOCK ***
> [   38.836027][    C0]
> [   38.844049][    C0] 1 lock held by systemd/1:
> [ 38.848459][ C0] #0: ffffffff84b2b740 (rcu_callback){....}-{0:0}, at: rc=
u_do_batch (include/linux/rcupdate.h:327 kernel/rcu/tree.c:2107)=20
> [   38.857460][    C0]
> [   38.857460][    C0] stack backtrace:
> [   38.863234][    C0] CPU: 0 PID: 1 Comm: systemd Not tainted 6.3.0-rc5-=
00001-g1dbf9cad3182 #1
> [   38.871704][    C0] Hardware name: Intel Corporation Mehlow UP Server =
Platform/Moss Beach Server, BIOS CNLSE2R1.R00.X188.B13.1903250419 03/25/201=
9
> [   38.884840][    C0] Call Trace:
> [   38.888010][    C0]  <IRQ>
> [ 38.890738][ C0] dump_stack_lvl (lib/dump_stack.c:108)=20
> [ 38.895121][ C0] mark_lock_irq (kernel/locking/lockdep.c:3934 kernel/loc=
king/lockdep.c:3976 kernel/locking/lockdep.c:4179)=20
> [ 38.899596][ C0] ? print_usage_bug+0x660/0x660=20
> [ 38.905015][ C0] ? stack_trace_save (kernel/stacktrace.c:123)=20
> [ 38.909748][ C0] ? filter_irq_stacks (kernel/stacktrace.c:114)=20
> [ 38.914565][ C0] ? is_bpf_text_address (include/linux/rcupdate.h:332 inc=
lude/linux/rcupdate.h:806 kernel/bpf/core.c:721)=20
> [ 38.919648][ C0] ? lock_release (kernel/locking/lockdep.c:467 kernel/loc=
king/lockdep.c:5691)=20
> [ 38.924117][ C0] ? save_trace (kernel/locking/lockdep.c:586)=20
> [ 38.928440][ C0] mark_lock+0x4ce/0xac0=20
> [ 38.933183][ C0] ? mark_lock_irq (kernel/locking/lockdep.c:4594)=20
> [ 38.937830][ C0] mark_usage (kernel/locking/lockdep.c:4530)=20
> [ 38.941956][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
> [ 38.946603][ C0] ? mark_lock_irq (kernel/locking/lockdep.c:4594)=20
> [ 38.951247][ C0] ? slab_free_freelist_hook (mm/slub.c:1807)=20
> [ 38.956668][ C0] ? mark_usage (kernel/locking/lockdep.c:4914)=20
> [ 38.961057][ C0] ? __irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c=
:650)=20
> [ 38.965786][ C0] ? irq_exit_rcu (kernel/softirq.c:664)=20
> [ 38.970086][ C0] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/api=
c.c:1107 (discriminator 14))=20
> [ 38.975775][ C0] ? mark_usage (kernel/locking/lockdep.c:4560)=20
> [ 38.980160][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locki=
ng/lockdep.c:5671 kernel/locking/lockdep.c:5634)=20
> [ 38.984544][ C0] ? xa_destroy (lib/xarray.c:2214)=20
> [ 38.988843][ C0] ? lock_release (kernel/locking/lockdep.c:5637)=20
> [ 38.993398][ C0] ? mark_usage (kernel/locking/lockdep.c:4914)=20
> [ 38.997819][ C0] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.=
h:111 kernel/locking/spinlock.c:162)=20
> [ 39.002900][ C0] ? xa_destroy (lib/xarray.c:2214)=20
> [ 39.007192][ C0] xa_destroy (lib/xarray.c:2214)=20
> [ 39.011312][ C0] ? xas_free_nodes (lib/xarray.c:2208)=20
> [ 39.016048][ C0] ? lock_release (kernel/locking/lockdep.c:5637)=20
> [ 39.020607][ C0] ? kmem_cache_free (mm/slub.c:3787 mm/slub.c:3809)=20
> [ 39.025460][ C0] shmem_free_in_core_inode (mm/shmem.c:2989 mm/shmem.c:40=
61)=20
> [ 39.030712][ C0] rcu_do_batch (include/linux/rcupdate.h:332 kernel/rcu/t=
ree.c:2114)=20
> [ 39.035099][ C0] ? rcu_check_gp_kthread_starvation (kernel/rcu/tree.c:20=
51)=20
> [ 39.041300][ C0] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c=
:4599 kernel/locking/lockdep.c:4530)=20
> [ 39.047762][ C0] ? note_gp_changes (arch/x86/include/asm/irqflags.h:42 (=
discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator 1) arch/=
x86/include/asm/irqflags.h:135 (discriminator 1) kernel/rcu/tree.c:1234 (di=
scriminator 1))=20
> [ 39.052579][ C0] rcu_core (kernel/rcu/tree.c:2374)=20
> [ 39.056616][ C0] __do_softirq (arch/x86/include/asm/jump_label.h:27 incl=
ude/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:=
572)=20
> [ 39.060996][ C0] __irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:6=
50)=20
> [ 39.065551][ C0] irq_exit_rcu (kernel/softirq.c:664)=20
> [ 39.069674][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.=
c:1107 (discriminator 14))=20
> [   39.075188][    C0]  </IRQ>
> [   39.078013][    C0]  <TASK>
> [ 39.080833][ C0] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/i=
dtentry.h:645)=20
> [ 39.086690][ C0] RIP: 0010:_raw_spin_unlock_irqrestore (kernel/locking/s=
pinlock.c:195)=20
> [ 39.092983][ C0] Code: 89 f3 48 8b 74 24 10 48 83 c7 18 e8 81 e6 a6 fd 4=
8 89 ef e8 e9 4e a7 fd 80 e7 02 74 06 e8 ef 70 cb fd fb 65 ff 0d 3f b3 75 7=
c <5b> 5d c3 0f 1f 40 00 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 fd 65 ff
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0: 89 f3                 mov    %esi,%ebx
>   2: 48 8b 74 24 10        mov    0x10(%rsp),%rsi
>   7: 48 83 c7 18           add    $0x18,%rdi
>   b: e8 81 e6 a6 fd        callq  0xfffffffffda6e691
>  10: 48 89 ef              mov    %rbp,%rdi
>  13: e8 e9 4e a7 fd        callq  0xfffffffffda74f01
>  18: 80 e7 02              and    $0x2,%bh
>  1b: 74 06                 je     0x23
>  1d: e8 ef 70 cb fd        callq  0xfffffffffdcb7111
>  22: fb                    sti   =20
>  23: 65 ff 0d 3f b3 75 7c decl   %gs:0x7c75b33f(%rip)        # 0x7c75b369
>  2a:* 5b                    pop    %rbx <-- trapping instruction
>  2b: 5d                    pop    %rbp
>  2c: c3                    retq  =20
>  2d: 0f 1f 40 00           nopl   0x0(%rax)
>  31: f3 0f 1e fa           endbr64=20
>  35: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>  3a: 55                    push   %rbp
>  3b: 48 89 fd              mov    %rdi,%rbp
>  3e: 65                    gs
>  3f: ff                    .byte 0xff
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0: 5b                    pop    %rbx
>   1: 5d                    pop    %rbp
>   2: c3                    retq  =20
>   3: 0f 1f 40 00           nopl   0x0(%rax)
>   7: f3 0f 1e fa           endbr64=20
>   b: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>  10: 55                    push   %rbp
>  11: 48 89 fd              mov    %rdi,%rbp
>  14: 65                    gs
>  15: ff                    .byte 0xff
>=20
>=20
> To reproduce:
>=20
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        sudo bin/lkp install job.yaml           # job file is attached in =
this email

The above step fails on my Fedora 37 system:

...
Dependencies resolved.
Nothing to do.
Complete!
Use: /home/cel/lkp-tests/distro/installer/fedora install alsa-lib-devel att=
r binutils-devel bison compat-readline5-devel conntrack dwarves ebtables el=
futils-devel ethtool file flex fuse fuse-devel g++ gcc glibc-common glibc-d=
evel glibc-static glibc-devel.i686 glibc-static.i686 glibc.i686 glibc.x86_6=
4 iperf3 iproute iptables iputils ipvsadm jq kernel-headers keyutils-libs-d=
evel lib32gcc-dev libbpf-dev libc6-x32 libcap-devel libcap-ng-devel libdrm-=
devel libgcc.i686 libhugetlbfs-dev libmnl-devel libmount-devel libpci3 libx=
32asan5 libx32atomic1 libx32gcc1 libx32gcc-dev libx32gomp1 libx32itm1 libx3=
2quadmath0 libx32ubsan1 linux-libc-dev-amd64-cross llvm-devel make netsniff=
-ng net-tools nftables nmap-ncat numactl-devel openssl-devel openvswitch-co=
mmon openvswitch-switch perf pesign pkgconfig popt popt-devel python3 pytho=
n3-scapy python-docutils rsync sendip socat sudo tcpdump traceroute util-li=
nux wireshark xz zlib-devel autoconf automake bc binutils-devel compat-read=
line5-devel elfutils-devel gettext libbpf-dev libmnl-devel libnl3-devel lib=
pcap-devel libpci-dev libtool m4 openssl-devel pkgconfig popt-devel systemd=
 systemd-devel systemd-libs  Last metadata expiration check: 1:45:19 ago on=
 Mon 10 Apr 2023 10:06:05 AM EDT.
Package alsa-lib-devel-1.2.8-2.fc37.x86_64 is already installed.
Package attr-2.5.1-5.fc37.x86_64 is already installed.
Package binutils-devel-2.38-25.fc37.x86_64 is already installed.
Package bison-3.8.2-3.fc37.x86_64 is already installed.
Package conntrack-tools-1.4.6-4.fc37.x86_64 is already installed.
Package dwarves-1.24-1.fc37.x86_64 is already installed.
Package iptables-nft-1.8.8-4.fc37.x86_64 is already installed.
Package elfutils-devel-0.189-1.fc37.x86_64 is already installed.
Package ethtool-2:6.2-1.fc37.x86_64 is already installed.
Package file-5.42-4.fc37.x86_64 is already installed.
Package flex-2.6.4-11.fc37.x86_64 is already installed.
Package fuse-devel-2.9.9-15.fc37.x86_64 is already installed.
Package gcc-c++-12.2.1-4.fc37.x86_64 is already installed.
Package gcc-12.2.1-4.fc37.x86_64 is already installed.
Package glibc-common-2.36-9.fc37.x86_64 is already installed.
Package glibc-devel-2.36-9.fc37.x86_64 is already installed.
Package glibc-devel-2.36-9.fc37.i686 is already installed.
Package glibc-static-2.36-9.fc37.x86_64 is already installed.
Package glibc-static-2.36-9.fc37.i686 is already installed.
Package glibc-devel-2.36-9.fc37.i686 is already installed.
Package glibc-static-2.36-9.fc37.i686 is already installed.
Package glibc-2.36-9.fc37.i686 is already installed.
Package glibc-2.36-9.fc37.x86_64 is already installed.
Package iproute-5.18.0-2.fc37.x86_64 is already installed.
Package iptables-nft-1.8.8-4.fc37.x86_64 is already installed.
Package iputils-20221126-1.fc37.x86_64 is already installed.
Package jq-1.6-14.fc37.x86_64 is already installed.
Package kernel-headers-6.1.5-200.fc37.x86_64 is already installed.
Package keyutils-libs-devel-1.6.1-5.fc37.x86_64 is already installed.
No match for argument: lib32gcc-dev
No match for argument: libbpf-dev
No match for argument: libc6-x32
Package libcap-devel-2.48-5.fc37.x86_64 is already installed.
Package libcap-ng-devel-0.8.3-3.fc37.x86_64 is already installed.
Package libgcc-12.2.1-4.fc37.i686 is already installed.
No match for argument: libhugetlbfs-dev
Package libmnl-devel-1.0.5-1.fc37.x86_64 is already installed.
Package libmount-devel-2.38.1-1.fc37.x86_64 is already installed.
No match for argument: libpci3
No match for argument: libx32asan5
No match for argument: libx32atomic1
No match for argument: libx32gcc1
No match for argument: libx32gcc-dev
No match for argument: libx32gomp1
No match for argument: libx32itm1
No match for argument: libx32quadmath0
No match for argument: libx32ubsan1
No match for argument: linux-libc-dev-amd64-cross
Package make-1:4.3-11.fc37.x86_64 is already installed.
Package net-tools-2.0-0.64.20160912git.fc37.x86_64 is already installed.
Package nftables-1:1.0.4-3.fc37.x86_64 is already installed.
Package nmap-ncat-3:7.93-1.fc37.x86_64 is already installed.
Package numactl-devel-2.0.14-6.fc37.x86_64 is already installed.
Package openssl-devel-1:3.0.8-1.fc37.x86_64 is already installed.
No match for argument: openvswitch-common
No match for argument: openvswitch-switch
Package perf-6.2.6-200.fc37.x86_64 is already installed.
Package pkgconf-pkg-config-1.8.0-3.fc37.x86_64 is already installed.
Package popt-1.19-1.fc37.x86_64 is already installed.
Package popt-devel-1.19-1.fc37.x86_64 is already installed.
Package python3-3.11.2-1.fc37.x86_64 is already installed.
Package python3-docutils-0.18.1-2.fc37.noarch is already installed.
Package rsync-3.2.7-1.fc37.x86_64 is already installed.
No match for argument: sendip
Package sudo-1.9.13-1.p2.fc37.x86_64 is already installed.
Package tcpdump-14:4.99.3-1.fc37.x86_64 is already installed.
Package traceroute-3:2.1.2-1.fc37.x86_64 is already installed.
Package util-linux-2.38.1-1.fc37.x86_64 is already installed.
Package xz-5.4.1-1.fc37.x86_64 is already installed.
Package zlib-devel-1.2.12-5.fc37.x86_64 is already installed.
Package autoconf-2.71-4.fc37.noarch is already installed.
Package automake-1.16.5-9.fc37.noarch is already installed.
Package bc-1.07.1-16.fc37.x86_64 is already installed.
Package gettext-0.21.1-1.fc37.x86_64 is already installed.
Package libnl3-devel-3.7.0-2.fc37.x86_64 is already installed.
No match for argument: libpci-dev
Package libtool-2.4.7-2.fc37.x86_64 is already installed.
Package m4-1.4.19-4.fc37.x86_64 is already installed.
Package systemd-251.14-2.fc37.x86_64 is already installed.
Package systemd-devel-251.14-2.fc37.x86_64 is already installed.
Package systemd-libs-251.14-2.fc37.x86_64 is already installed.
Error: Unable to find a match: lib32gcc-dev libbpf-dev libc6-x32 libhugetlb=
fs-dev libpci3 libx32asan5 libx32atomic1 libx32gcc1 libx32gcc-dev libx32gom=
p1 libx32itm1 libx32quadmath0 libx32ubsan1 linux-libc-dev-amd64-cross openv=
switch-common openvswitch-switch sendip libpci-dev
Cannot install some packages of kernel-selftests depends
[cel@manet lkp-tests]$

These missing packages appear to be Debian packages.


>        bin/lkp split-job --compatible job.yaml # generate the yaml file f=
or lkp run
>        sudo bin/lkp run generated-yaml-file
>=20
>        # if come across any failure that blocks the test,
>        # please remove ~/.lkp and /lkp dir to run from a clean state.
>=20
>=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>=20
>=20
> <config-6.3.0-rc5-00001-g1dbf9cad3182><job-script.txt><dmesg.xz><kernel-s=
elftests.txt><job.yaml><reproduce.txt>

--
Chuck Lever


